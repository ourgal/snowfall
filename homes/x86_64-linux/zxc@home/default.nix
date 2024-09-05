{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimal = enabled;
    hyprland.minimal = enabled;
    sway.minimal = enabled;
    qtile.Cozytile = enabled;
    fonts = enabled;
    cli = enabled;
    desktop = enabled // {
      editor = enabled;
    };
    dev = enabled;
  };
}
