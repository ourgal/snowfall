args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      systemdServices.xbanish = {
        startPre = "${pkgs.coreutils-full}/bin/sleep 10";
        start = lib.getExe pkgs.xbanish;
      };
    }
  )
)
