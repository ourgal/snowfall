args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "transmission_4";
    myPkgs = [
      # keep-sorted start
      "anime"
      "tewi"
      # keep-sorted end
    ];
    enable = "service";
  }
)
