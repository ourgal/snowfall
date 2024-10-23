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
      "rep-grep"
      "repgrep"
      "ruplacer"
      "sad"
      "sd"
      # keep-sorted end
    ];
    enable = "serpl";
  }
)
