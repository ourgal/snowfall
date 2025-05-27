{
  progs.fish.functions.scroff = {
    body = # fish
      ''
        if test $XDG_CURRENT_DESKTOP = "Hyprland"
          hyprctl dispatch dpms off
        else
          xset dpms force off
        end
      '';
    description = "turn screen off";
  };
}
