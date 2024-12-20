args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "safeeyes";
      systemdServices.safeeyes = {
        start = "${pkgs.safeeyes}/bin/safeeyes";
      };
    }
  )
)
