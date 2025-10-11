args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      systemdServices.scream = {
        after = "pipewire-pulse.service";
        start = lib.getExe pkgs.scream;
      };
    }
  )
)
