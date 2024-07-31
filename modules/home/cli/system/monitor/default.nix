{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = "htop";
    nixPkgs = [
      "btop"
      "glances"
      "nvtop"
      "zenith"
    ];
  }
)
