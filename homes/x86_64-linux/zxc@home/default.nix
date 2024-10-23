{ lib, namespace, ... }:
let
  inherit (lib.${namespace}) enabled;
in
{
  dot = {
    awesome.minimalFnl = enabled;
    hyprland.minimal = enabled;
    sway.minimal = enabled;
    qtile.Cozytile = enabled;
    fonts = enabled;
    cli = enabled;
    desktop = enabled // {
      editor = enabled;
      flatpak = enabled;
    };
    dev = enabled;
  };
}
