{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      progs = [
        "scmpuff"
        {
          git.aliases = {
            f = "!${pkgs.zsh-forgit}/bin/git-forgit";
            fa = "!${pkgs.zsh-forgit}/bin/git-forgit add";
            fr = "!${pkgs.zsh-forgit}/bin/git-forgit reset_head";
            fchf = "!${pkgs.zsh-forgit}/bin/git-forgit checkout_file";
          };
        }
      ];
      nixPkgs = [
        # keep-sorted start
        "bit"
        "zsh-forgit"
        # keep-sorted end
      ];
    }
  )
)
