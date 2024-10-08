{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "px";
    nixPkgs = [
      # keep-sorted start
      "procs"
      # keep-sorted end
    ];
  }
)
