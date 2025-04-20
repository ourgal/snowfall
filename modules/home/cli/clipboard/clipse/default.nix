args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "clipse";
      systemdServices.clipse = {
        start = "${pkgs.clipse}/bin/clipse --listen-shell";
      };
    }
  )
)
