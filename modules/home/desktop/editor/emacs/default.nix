{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      emacs = {
        extraPackages = epkgs: [ epkgs.vterm ];
      };
    };
    servs = "emacs";
    value = with args; {
      systemd.user.services.emacs.Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
    };
  }
)
