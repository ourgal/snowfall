alias u := update
alias m := chezmoi

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
    @deploy .#{{ host }}

go pkg:
    @nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.{{ pkg }}.goModules.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | xclip

rust pkg:
    @nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.{{ pkg }}.cargoDeps.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | xclip

search pkg:
    @nix-search {{ pkg }}

searchc pkg:
    @nix-search -c $(cat /etc/os-release | grep VERSION_ID | cut -d\" -f 2) {{ pkg }}

drift pkg:
    @drift update --flake $(git root) {{ pkg }}

mmdoc:
    @mmdoc dotfiles mmdoc out

chezmoi:
    @chezmoi apply

anywhere host ip ssh:
    #!/usr/bin/env bash

    # Create a temporary directory
    temp=$(mktemp -d)

    # Function to cleanup temporary directory on exit
    cleanup() {
      rm -rf "$temp"
    }
    trap cleanup EXIT

    # Create the directory where sshd expects to find the host keys
    install -d -m755 "$temp/etc/ssh"

    # Decrypt your private key from the password store and copy it to the temporary directory
    gopass ssh/{{ ssh }}/ed25519_key > "$temp/etc/ssh/ssh_host_ed25519_key"
    gopass ssh/{{ ssh }}/ed25519_key.pub > "$temp/etc/ssh/ssh_host_ed25519_key.pub"
    gopass ssh/{{ ssh }}/rsa_key > "$temp/etc/ssh/ssh_host_rsa_key"
    gopass ssh/{{ ssh }}/rsa_key.pub > "$temp/etc/ssh/ssh_host_rsa_key.pub"

    # Set the correct permissions so sshd will accept the key
    chmod 600 "$temp/etc/ssh/ssh_host_ed25519_key"
    chmod 644 "$temp/etc/ssh/ssh_host_ed25519_key.pub"
    chmod 600 "$temp/etc/ssh/ssh_host_rsa_key"
    chmod 644 "$temp/etc/ssh/ssh_host_rsa_key.pub"

    # Install NixOS to the host system with our secrets
    nixos-anywhere --disk-encryption-keys /key/keyfile /media/ASUSBIOS/keyfile --extra-files "$temp" --flake .#{{ host }} --target-host root@{{ ip }}

qutebrowser:
    @make -C modules/home/desktop/browser/qutebrowser

repo:
    #!/usr/bin/env bash
    set -euo pipefail
    clip=$(xsel -b)
    api_url=${clip/github.com/api.github.com/repos}
    repo_json=$(curl "$api_url")
    description=$(jq -r ".description" <(echo "$repo_json"))
    name=$(jq -r .name <(echo "$repo_json"))
    res="('$name',
    '$description',
    '$clip',5,'$(date +%m/%d/%Y)',null,1,1),"
    echo "$res" | xsel -ib
