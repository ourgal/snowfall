args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      systemdServices.xbanish = {
        startPre = "${pkgs.coreutils-full}/bin/sleep 10";
        start = "${pkgs.xbanish}/bin/xbanish";
      };
    }
  )
)
