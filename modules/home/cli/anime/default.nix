{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "ani-cli";
    myPkgs = [
      # keep-sorted start
      "adl"
      "animdl"
      "curd"
      "fast-anime"
      "lobster"
      "toru"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
