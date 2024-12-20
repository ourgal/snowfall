args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
      systemdServices.scream = {
        after = "pipewire-pulse.service";
        start = "${pkgs.scream}/bin/scream";
      };
    }
  )
)
