default: home

home:
    @git add .
    @nh home switch

update:
	@cache -s "$(date +%Y-%m-%d)" -- nvfetcher --keyfile keyfile.toml

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
