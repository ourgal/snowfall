args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      myPkgs = [
        # keep-sorted start
        "git-ink"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "git-branchless"
        "git-my"
        "git-recent"
        "git-trim"
        # keep-sorted end
      ];
      progs.git.aliases.bb = "!${pkgs.${namespace}.better-git-branch}/bin/better-git-branch";
    }
  )
)
