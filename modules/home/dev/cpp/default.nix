args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ccls"
      "clang-tools"
      "cppcheck"
      "cpplint"
      "gcc"
      # keep-sorted end
    ];
  }
)
