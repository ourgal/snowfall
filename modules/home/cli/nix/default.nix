{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "deploy-rs"
      "nix-du"
      "nix-generate-from-cpan"
      "nix-info"
      "nix-melt"
      "nix-output-monitor"
      "nix-search-cli"
      "nix-template"
      "nix-tree"
      "nixos-anywhere"
      "nurl"
      "nvd"
      # keep-sorted end
    ];
    snowPkgs = [
      # keep-sorted start
      "flake"
      "thaw"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "nix-auto-follow"
      "nix-repl"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "comma"
      "home-manager"
      "settings"
      # keep-sorted end
    ];
  }
)
