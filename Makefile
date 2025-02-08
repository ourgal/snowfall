# https://stackoverflow.com/a/14061796
MAKE_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
$(eval $(MAKE_ARGS):;@:)

##@
##@ main
##@

.PHONY: home
home: ##@ home manager switch
	@git add .
	@nh home switch --backup-extension bak

.PHONY: u
u: update ##@ nvfetcher update

.PHONY: m
m: chezmoi ##@ chezmoi apply

.PHONY: update
update: ##@ nvfetcher update
	@nvfetcher --keyfile keyfile.toml

.PHONY: man-home
man-home: ##@ home man page
	@man home-configuration.nix

.PHONY: man-nixos
man-nixos: ##@ home man page
	@man 5 configuration.nix

.PHONY: deploy
deploy: ##@ deploy to host
	@git add .
	@deploy .#$(MAKE_ARGS)

.PHONY: go
go: ##@ nix-prefetch go package hash
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.$(MAKE_ARGS).goModules.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | tr -d '\n' | xclip

.PHONY: rust
rust: ##@ nix-prefetch rust package hash
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.$(MAKE_ARGS).cargoDeps.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | tr -d '\n' | xclip

.PHONY: s
s: search ##@ nix-search unstable packages

.PHONY: search
search: ##@ nix-search unstable packages
	@nix-search $(MAKE_ARGS)

.PHONY: sc
sc: searchc ##@ nix-search stable packages

.PHONY: searchc
searchc: ##@ nix-search stable packages
	@nix-search -c "$$(cat /etc/os-release | grep VERSION_ID | cut -d\" -f 2)" $(MAKE_ARGS)

.PHONY: drift
drift: ##@ drift update package hash
	@drift update --flake $$(git root) $(MAKE_ARGS)

.PHONY: mmdoc
mmdoc: ##@ generate doc
	@mmdoc dotfiles mmdoc out

.PHONY: chezmoi
chezmoi: ##@ chezmoi apply
	@chezmoi apply

##@
##@ misc
##@

.PHONY: help
help: ##@ Print listing of key targets with their descriptions
	@printf "\nUsage: make <command>\n"
	@grep -F -h "##@" $(MAKEFILE_LIST) | grep -F -v grep -F | sed -e 's/\\$$//' | awk 'BEGIN {FS = ":*[[:space:]]*##@[[:space:]]*"}; \
	{ \
		if($$2 == "") \
			pass; \
		else if($$0 ~ /^#/) \
			printf "\n%s\n", $$2; \
		else if($$1 == "") \
			printf "     %-20s%s\n", "", $$2; \
		else \
			printf "\n    \033[34m%-20s\033[0m %s\n", $$1, $$2; \
	}'
