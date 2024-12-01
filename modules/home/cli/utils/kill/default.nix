args:
args.module (
  args
  // {
    path = ./.;
    nodePkgs = "fkill-cli";
    nixPkgs = [
      # keep-sorted start
      "killport"
      "pik"
      # keep-sorted end
    ];
  }
)
