args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      systemdServices.bucklespring = {
        restart = "always";
        start = "${pkgs.bucklespring-libinput}/bin/buckle";
      };
    }
  )
)
