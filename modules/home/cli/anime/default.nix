args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "adl"
      "ani-cli"
      "ani-skip"
      "animdl"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "fast-anime"
      "lobster"
      "sauce"
      "toru"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
