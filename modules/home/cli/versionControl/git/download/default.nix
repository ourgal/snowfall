{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "fetch"
      "github-dlr"
      # keep-sorted end
    ];
  }
)
