{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs pkgs;
    in
    {
      path = ./.;
      inputPkgs = [ inputs.gitwatch.packages."${pkgs.system}".default ];
      myPkgs = [
        # keep-sorted start
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
