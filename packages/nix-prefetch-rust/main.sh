nix-prefetch --option extra-experimental-features flakes "{ sha256 }: (builtins.getFlake (toString ./.)).packages.x86_64-linux.$1.cargoDeps.overrideAttrs (_: { vendorSha256 = sha256; })" | tee /dev/tty | xclip