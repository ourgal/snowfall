args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      systemdServices.xbanish = {
        startPre = "${pkgs.coreutils-full}/bin/sleep 10";
        start = "${pkgs.xbanish}/bin/xbanish";
      };
    }
  )
)
