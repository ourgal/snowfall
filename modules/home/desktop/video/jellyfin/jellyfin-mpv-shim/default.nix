args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      systemdServices.jellyfin-mpv-shim = {
        online = true;
        gui = true;
        start = lib.getExe pkgs.jellyfin-mpv-shim;
      };
    }
  )
)
