args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "c";
    nixPkgs = [
      # keep-sorted start
      "clang-tools"
      "flawfinder"
      "splint"
      # keep-sorted end
    ];
  }
)
