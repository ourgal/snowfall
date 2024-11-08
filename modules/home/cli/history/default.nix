args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "cmd-wrapped"
      "tsukae"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "hishtory"
      "shellclear"
      # keep-sorted end
    ];
  }
)
