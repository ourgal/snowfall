args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "safeeyes";
      systemdServices.safeeyes = {
        start = lib.getExe pkgs.safeeyes;
      };
    }
  )
)
