{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "hl"
      "toolong"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "fblog"
      "lnav"
      # keep-sorted end
    ];
  }
)
