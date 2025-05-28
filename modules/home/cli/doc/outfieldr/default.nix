args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      nixPkgs = "outfieldr";
      services.tldr-update.package = pkgs.outfieldr;
    }
  )
)
