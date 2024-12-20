args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "jellyfin-mpv-shim";
      confs.jellyfin-mpv-shim = ./mpv.conf;
      systemdServices.jellyfin-mpv-shim = {
        online = true;
        start = "${pkgs.jellyfin-mpv-shim}/bin/jellyfin-mpv-shim";
      };
    }
  )
)
