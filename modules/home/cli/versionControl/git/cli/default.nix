args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      progs.git.settings.aliases = {
        f = "!${lib.getExe pkgs.zsh-forgit}";
        fa = "!${lib.getExe pkgs.zsh-forgit} add";
        fr = "!${lib.getExe pkgs.zsh-forgit} reset_head";
        fchf = "!${lib.getExe pkgs.zsh-forgit} checkout_file";
      };
      nixPkgs = [
        # keep-sorted start
        "bit"
        "git-extras"
        "git-toolbelt"
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
