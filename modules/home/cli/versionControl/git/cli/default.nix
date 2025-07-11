args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      myPkgs = "git-toolbelt";
      progs.git.aliases = {
        f = "!${pkgs.zsh-forgit}/bin/git-forgit";
        fa = "!${pkgs.zsh-forgit}/bin/git-forgit add";
        fr = "!${pkgs.zsh-forgit}/bin/git-forgit reset_head";
        fchf = "!${pkgs.zsh-forgit}/bin/git-forgit checkout_file";
      };
      nixPkgs = [
        # keep-sorted start
        "bit"
        "git-extras"
        "zsh-forgit"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "gut"
        "scmpuff"
        # keep-sorted end
      ];
    }
  )
)
