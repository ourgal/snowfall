args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "cached-nix-shell"
      "deploy-rs"
      "nix-du"
      "nix-generate-from-cpan"
      "nix-info"
      "nix-inspect"
      "nix-melt"
      "nix-output-monitor"
      "nix-prefetch"
      "nix-search-cli"
      "nix-template"
      "nix-tree"
      "nix-update"
      "nixos-anywhere"
      "nurl"
      "nvd"
      "nvfetcher"
      "toml2nix"
      "attic-client"
      # keep-sorted end
    ];
    snowPkgs = [
      # keep-sorted start
      "drift"
      "flake"
      "thaw"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "nix-auto-follow"
      "nix-repl"
      "nix-searchc"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "comma"
      "home-manager"
      "manix"
      "nix-your-shell"
      "settings"
      # keep-sorted end
    ];
  }
)
