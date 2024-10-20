args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      inputPkgs = (p: [ p.gitwatch.packages."${pkgs.system}".default ]);
      myPkgs = [
        # keep-sorted start
        "gac"
        "gace"
        "git-sumi"
        "gogitmoji"
        "goji"
        "koji"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "commitizen"
        "gitmoji-cli"
        # keep-sorted end
      ];
      enable = "geminicommit";
    }
  )
)
