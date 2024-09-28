{ ... }@args:
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
        "git-my"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "git-branchless"
        # keep-sorted end
      ];
      progs = {
        git.aliases.bb = "!${pkgs.${namespace}.better-git-branch}/bin/better-git-branch";
      };
    }
  )
)
