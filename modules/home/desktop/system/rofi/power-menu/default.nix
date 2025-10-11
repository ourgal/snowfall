args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace lib;
    in
    {
      value = {
        ${namespace}.desktop.system.rofi.modes = [ "power:${lib.getExe pkgs.rofi-power-menu}" ];
      };
    }
  )
)
