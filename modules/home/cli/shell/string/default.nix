{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "pyp"
      "sttr"
      "teip"
      # keep-sorted end
    ];
  }
)
