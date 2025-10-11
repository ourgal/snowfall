args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace lib;
    in
    {
      servs.screen-locker.lockCmd = lib.getExe pkgs.${namespace}.i3lock-color;
    }
  )
)
