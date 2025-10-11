args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      nixPkgs = "clipse";
      systemdServices.clipse = {
        start = "${lib.getExe pkgs.clipse} --listen-shell";
      };
    }
  )
)
