args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "cppcheck"
      "cpplint"
      "gcc"
      # keep-sorted end
    ];
  }
)
