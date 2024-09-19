{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "protonvpn-cli"
      "protonvpn-gui"
    ];
  }
)
