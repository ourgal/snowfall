args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ani-cli"
      "animdl"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "adl"
      "curd"
      "fast-anime"
      "lobster"
      "toru"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
