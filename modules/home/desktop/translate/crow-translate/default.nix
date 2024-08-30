{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "crow-translate";
    value = with args; {
      systemd.user.services.crow-translate = {
        Unit = {
          Description = "Crow Translate";
          Wants = "network-online.target";
          After = "network-online.target";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.crow-translate}/bin/crow";
        };
      };
    };
  }
)
