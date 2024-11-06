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
        "gitlint"
        "gitmoji-cli"
        "glitter"
        # keep-sorted end
      ];
      enable = "geminicommit";
    }
  )
)
