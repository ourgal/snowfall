{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "jellyfin-mpv-shim";
    confs = {
      jellyfin-mpv-shim = ./mpv.conf;
    };
    value = with args; {
      systemd.user.services.jellyfin-mpv-shim = {
        Unit = {
          Description = "MPV Cast Client for Jellyfin";
          Wants = "network-online.target";
          After = "network-online.target";
        };
        Install = {
          WantedBy = [ "default.target" ];
        };
        Service = {
          ExecStart = "${pkgs.jellyfin-mpv-shim}/bin/jellyfin-mpv-shim";
        };
      };
    };
  }
)
