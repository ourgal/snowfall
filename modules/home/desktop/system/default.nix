{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "brightnessctl"
      "clash-verge"
      "fuzzel"
      "libnotify"
      "polkit"
      "ripdrag"
      "scrcpy"
      "swww"
      "variety"
      "xclip"
    ];
    enable = [
      "barrier"
      "cursor"
      "dunst"
      "espanso"
      "flameshot"
      "gammastep"
      "gtk"
      "kdeconnect"
      "kmonad"
      "maim"
      "picom"
      "playerctl"
      "qt"
      "redshift"
      "rofi"
      "sbsrf"
      "scream"
    ];
    value = with args; {
      colorScheme = inputs.nix-colors.colorSchemes.gigavolt;
      ${namespace}.desktop.system = {
        waybar = {
          slickbar = enabled;
          clock24h = enabled;
        };
      };
    };
  }
)
