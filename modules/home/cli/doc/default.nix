{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bk"
      "cheat"
      # keep-sorted end
    ];
  }
)
