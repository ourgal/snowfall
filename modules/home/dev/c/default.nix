args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "c";
    nixPkgs = [
      # keep-sorted start
      "clang-tools"
      "splint"
      # keep-sorted end
    ];
  }
)
