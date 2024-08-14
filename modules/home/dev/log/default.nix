{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "toolong";
    nixPkgs = [
      # keep-sorted start
      "fblog"
      "lnav"
      # keep-sorted end
    ];
  }
)
