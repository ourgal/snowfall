args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib namespace;
    in
    {
      systemdServices.scream = {
        after = "pipewire-pulse.service";
        start = "${lib.getExe pkgs.scream} -u -i ${lib.${namespace}.ip.home} -p 4011";
      };
    }
  )
)
