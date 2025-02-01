args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "emacs-lsp-booster"
        "gnuplot"
        # keep-sorted end
      ];
      progs.emacs = {
        extraPackages = epkgs: [ epkgs.vterm ];
        package = pkgs.emacs;
      };
      servs = "emacs";
      sessionPath = [ "$HOME/.config/emacs/bin" ]; # doomemacs
      value = {
        systemd.user.services.emacs.Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
      };
    }
  )
)
