{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "fetch"
      "fgit"
      "github-dlr"
      # keep-sorted end
    ];
  }
)
