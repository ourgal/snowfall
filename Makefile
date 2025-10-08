# https://stackoverflow.com/a/14061796
MAKE_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(MAKE_ARGS):;@:)

.PHONY: all clean test

all: home

.PHONY: home
home: qutebrowser # home manager switch
	@git add .
	@nh home switch --backup-extension bak

.PHONY: qutebrowser
qutebrowser: # update qutebrowser bookmarks
	@make -C modules/home/desktop/browser/qutebrowser

.PHONY: u
u: update # nvfetcher update

.PHONY: m
m: chezmoi # chezmoi apply

.PHONY: update
update: # nvfetcher update
	@nvfetcher --keyfile keyfile.toml

.PHONY: man-home
man-home: # home man page
	@man home-configuration.nix

.PHONY: man-nixos
man-nixos: # home man page
	@man 5 configuration.nix

$(eval $(MAKE_ARGS):;@:)

.PHONY: deploy
deploy: # deploy to host
	@git add .
	@deploy .#$(MAKE_ARGS)

.PHONY: colmena
colmena: # colmena
	@colmena apply --on $(MAKE_ARGS)

.PHONY: go
go: # nix-prefetch go package hash
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.$(MAKE_ARGS).goModules.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | tr -d '\n' | xclip

.PHONY: rust
rust: # nix-prefetch rust package hash
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.$(MAKE_ARGS).cargoDeps.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | tr -d '\n' | xclip

.PHONY: s
s: search # nix-search unstable packages

.PHONY: search
search: # nix-search unstable packages
	@nix-search $(MAKE_ARGS)

.PHONY: sc
sc: searchc # nix-search stable packages

.PHONY: searchc
searchc: # nix-search stable packages
	@nix-search -c "$$(cat /etc/os-release | grep VERSION_ID | cut -d\" -f 2)" $(MAKE_ARGS)

.PHONY: drift
drift: # drift update package hash
	@drift update --flake $$(git root) $(MAKE_ARGS)

.PHONY: mmdoc
mmdoc: # generate doc
	@mmdoc dotfiles mmdoc out

.PHONY: chezmoi
chezmoi: # chezmoi apply
	@chezmoi apply

.PHONY: db
db: # update database
	@-rm waiting.db
	@nix-shell -p python3Packages.pandas --run ./waiting.py

.PHONY: android
android: # nix-on-droid
	@nix-on-droid switch --flake .

.PHONY: help
help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done
