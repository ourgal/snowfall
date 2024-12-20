args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      nixPkgs = "clipse";
      systemdServices.clipse = {
        start = "${pkgs.clipse}/bin/clipse --listen-shell";
      };
    }
  )
)
