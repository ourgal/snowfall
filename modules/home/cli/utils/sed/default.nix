args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "play";
    nixPkgs = [
      # keep-sorted start
      "anew"
      "ruplacer"
      "sad"
      "sd"
      # keep-sorted end
    ];
    enable = "serpl";
  }
)
