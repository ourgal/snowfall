{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "fblog"
      "lnav"
      # keep-sorted end
    ];
  }
)
