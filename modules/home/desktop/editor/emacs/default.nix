{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "gnuplot";
      progs = {
        emacs = {
          extraPackages = epkgs: [ epkgs.vterm ];
          package = pkgs.emacs-gtk;
        };
      };
      servs = "emacs";
      value = {
        systemd.user.services.emacs.Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
      };
    }
  )
)
