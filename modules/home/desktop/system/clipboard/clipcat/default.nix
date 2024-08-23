{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "clipcat";
    confs = {
      clipcat = ./clipcatd.toml;
    };
    value = with args; {
      systemd.user.services.clipcat = {
        Unit = {
          Description = "Clipcat daemon";
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
        Service = {
          ExecStartPre = "${pkgs.coreutils-full}/bin/rm -f %t/clipcat/grpc.sock";
          ExecStart = "${pkgs.clipcat}/bin/clipcatd --no-daemon --replace";
        };
      };
    };
  }
)
