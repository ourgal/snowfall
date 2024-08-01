{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = with args; {
      emacs = {
        extraPackages = epkgs: [ epkgs.vterm ];
        package = pkgs.emacs-gtk;
      };
    };
    servs = "emacs";
    value = with args; {
      systemd.user.services.emacs.Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
    };
  }
)
