args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      systemdServices.bucklespring = {
        restart = "always";
        start = "${pkgs.bucklespring-libinput}/bin/buckle";
      };
    }
  )
)
