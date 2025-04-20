args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      systemdServices.jellyfin-mpv-shim = {
        online = true;
        gui = true;
        start = "${pkgs.jellyfin-mpv-shim}/bin/jellyfin-mpv-shim";
      };
    }
  )
)
