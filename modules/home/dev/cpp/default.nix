args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "cppcheck"
      "gcc"
      # keep-sorted end
    ];
  }
)
