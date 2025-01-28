args:
args.module (
  args
  // (
    let
      inherit (args) pkgs namespace;
    in
    {
      path = ./.;
      progs.rofi = {
        plugins = [ pkgs.rofi-emoji ];
      };
      value = {
        ${namespace}.desktop.system.rofi.modes = [ "emoji" ];
      };
    }
  )
)
