{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "procs"
      # keep-sorted end
    ];
  }
)
