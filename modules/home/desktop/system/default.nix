{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "blobdrop";
    nixPkgs = [
      # keep-sorted start
      "brightnessctl"
      "clash-verge"
      "clipqr"
      "fuzzel"
      "libnotify"
      "polkit"
      "ripdrag"
      "scrcpy"
      "swww"
      "variety"
      "xclip"
      "xcolor"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "barrier"
      "clipboard"
      "cursor"
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
      "sxhkd"
      "wired"
      "xbanish"
      # keep-sorted end
    ];
    value = with args; {
      colorScheme = inputs.nix-colors.colorSchemes.gigavolt;
      ${namespace}.desktop.system = {
        waybar = {
          hyprland = {
            slickbar = enabled;
            clock24h = enabled;
          };
        };
      };
    };
  }
)
