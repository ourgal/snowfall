{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    enable = [
      # keep-sorted start
      "btop"
      "htop"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "glances"
      "nvtop"
      "zenith"
      # keep-sorted end
    ];
  }
)
