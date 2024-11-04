default: home

home:
    @git add .
    @nh home switch

update:
    @nvfetcher --keyfile keyfile.toml

init url:
    #!/usr/bin/env bash
    declare -r url=$(echo '{{ url }}' | sed -E 's/(https.+)\?.+/\1/')
    declare -r dir=packages/$(basename "$url")
    mkdir -p "$dir"
    nix-init -u "$url" "$dir/default.nix"
