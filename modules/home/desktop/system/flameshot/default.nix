{
  servs = "flameshot";
  value = {
    xdg.desktopEntries = {
      flameshot_gui = {
        name = "Flameshot gui";
        exec = "flameshot gui --delay 500";
      };
      flameshot_screen = {
        name = "Flameshot screen";
        exec = "flameshot screen --delay 500";
      };
      flameshot_full = {
        name = "Flameshot full";
        exec = "flameshot full --delay 500";
      };
    };
  };
}
