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
      "fast-anime"
      "lobster"
      "sauce"
      "toru"
      # keep-sorted end
    ];
    enable = "trackma";
  }
)
