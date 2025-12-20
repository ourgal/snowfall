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
    cli = enabled // {
      ansible = enabled;
      chezmoi = enabled;
      music.lib-network = enabled;
      audio.player.mpd = enabled;
    };
    desktop = enabled // {
      editor = enabled;
      flatpak = enabled;
      game = enabled;
      time-tracker.activitywatch = enabled;
      translate.crow-translate = enabled;
      system = {
        mouse-actions = enabled;
        volnoti = enabled;
        scream = enabled;
      };
      video.jellyfin.jellyfin-mpv-shim = enabled;
    };
    dev = enabled;
    stylix = enabled;
  };
}
