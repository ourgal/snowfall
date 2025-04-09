args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "githooks"
      "lefthook"
      "pre-commit"
      # keep-sorted end
    ];
  }
)
