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
      "gitty"
      # keep-sorted end
    ];
  }
)
