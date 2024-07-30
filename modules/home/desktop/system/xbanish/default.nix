{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = with args; {
      systemd.user.services.xbanish = {
        Unit = {
          Description = "Xbanish autohide the mouse";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.xbanish}/bin/xbanish";
        };
      };
    };
  }
)
