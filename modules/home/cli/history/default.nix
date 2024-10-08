{ ... }@args:
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
    enable = "atuin";
  }
)
