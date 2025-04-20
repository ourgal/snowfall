args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "crow-translate";
      systemdServices.crow-translate = {
        online = true;
        start = "${pkgs.crow-translate}/bin/crow";
      };
    }
  )
)
