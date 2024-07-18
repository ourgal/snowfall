{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
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
