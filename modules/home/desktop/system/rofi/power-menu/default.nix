args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      value = {
        ${namespace}.desktop.system.rofi.modes = [ "power:${pkgs.rofi-power-menu}/bin/rofi-power-menu" ];
      };
    }
  )
)
