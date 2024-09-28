{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "git-spend"
      "gtm"
      # keep-sorted end
    ];
  }
)
