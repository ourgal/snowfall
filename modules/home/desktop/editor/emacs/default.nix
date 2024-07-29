{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = "emacs";
    servs = "emacs";
    value = with args; {
      systemd.user.services.emacs.Service.ExecStartPre = "${pkgs.coreutils-full}/bin/sleep 10";
    };
  }
)
