args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib;
    in
    {
      systemdServices.deskflow = {
        gui = true;
        start = lib.getExe pkgs.deskflow;
      };
    }
  )
)
