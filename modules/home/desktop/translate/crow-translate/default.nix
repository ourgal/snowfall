args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "crow-translate";
      systemdServices.crow-translate = {
        online = true;
        start = lib.getExe pkgs.crow-translate;
      };
    }
  )
)
