args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "play";
    nixPkgs = [
      # keep-sorted start
      "amber"
      "anew"
      "ruplacer"
      "sad"
      "sd"
      # keep-sorted end
    ];
    enable = "serpl";
  }
)
