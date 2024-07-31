{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "deploy-rs"
      "nix-du"
      "nix-generate-from-cpan"
      "nix-info"
      "nix-output-monitor"
      "nix-search-cli"
      "nix-template"
      "nix-tree"
      "nixos-anywhere"
      "nurl"
      "nvd"
    ];
    snowPkgs = [
      "flake"
      "thaw"
    ];
    enable = [
      "comma"
      "home-manager"
      "settings"
    ];
  }
)
