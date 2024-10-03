{ ... }@args:
args.module (
  args
  // {
    path = ./.;
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
