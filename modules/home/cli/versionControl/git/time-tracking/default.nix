{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "git-spend"
      # keep-sorted end
    ];
    enable = "gtm";
  }
)
