args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "safeeyes";
      systemdServices.safeeyes = {
        start = "${pkgs.safeeyes}/bin/safeeyes";
      };
    }
  )
)
