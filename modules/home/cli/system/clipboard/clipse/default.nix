{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "clipse";
    value = with args; {
      systemd.user.services.clipse = {
        Unit = {
          Description = "Clipse daemon";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.clipse}/bin/clipse --listen-shell";
        };
      };
    };
  }
)
