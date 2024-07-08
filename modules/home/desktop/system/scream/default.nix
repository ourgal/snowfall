{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    value = with args; {
      systemd.user.services.scream = {
        Unit = {
          Description = "Audio receiver for the Scream virtual network sound card.";
          After = "pipewire-pulse.service";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.scream}/bin/scream";
          Restart = "always";
          RestartSec = 10;
        };
      };
    };
  }
)
