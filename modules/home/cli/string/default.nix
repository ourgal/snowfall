args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "chepy";
    nixPkgs = [
      # keep-sorted start
      "gotemplate"
      "pyp"
      "sttr"
      "teip"
      # keep-sorted end
    ];
  }
)
