args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bear"
      "ccls"
      "clang-tools"
      "cppcheck"
      "cpplint"
      "flawfinder"
      "gcc"
      # keep-sorted end
    ];
  }
)
