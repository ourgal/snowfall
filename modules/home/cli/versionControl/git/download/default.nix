args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "cloneit";
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
