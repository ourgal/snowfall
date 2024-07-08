{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "safeeyes";
    value = with args; {
      systemd.user.services.safeeyes = {
        Unit = {
          Description = "Protect your eyes from eye strain";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.safeeyes}/bin/safeeyes";
          Restart = "always";
          RestartSec = 10;
        };
      };
    };
  }
)
