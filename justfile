alias u := update

default: home

home:
    @git add .
    @nh home switch

update:
	@nvfetcher --keyfile keyfile.toml

man-home:
	@man home-configuration.nix

man-nixos:
	@man 5 configuration.nix

init url:
    #!/usr/bin/env bash
    declare -r url=$(echo '{{ url }}' | sed -E 's/(https.+)\?.+/\1/')
    declare -r dir=packages/$(basename "$url")
    mkdir -p "$dir"
    nix-init -u "$url" "$dir/default.nix"

deploy host:
	@git add .
	@deploy .#{{host}}

go pkg:
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.{{pkg}}.goModules.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | xclip

rust pkg:
	@nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.{{pkg}}.cargoDeps.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | xclip

search pkg:
	@nix-search {{pkg}}

searchc pkg:
	@nix-search -c $(cat /etc/os-release | grep VERSION_ID | cut -d\" -f 2) {{pkg}}

drift pkg:
	@drift update --flake $(git root) {{pkg}}

mmdoc:
	@mmdoc dotfiles mmdoc out
