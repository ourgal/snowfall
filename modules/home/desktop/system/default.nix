args:
args.module (
  args
  // (
    let
      inherit (args)
        namespace
        inputs
        enabled
        pkgs
        ;
    in
    {
      path = ./.;
      myPkgs = "blobdrop";
      nixPkgs = [
        # keep-sorted start
        "brightnessctl"
        "clash-verge-rev"
        "fuzzel"
        "libnotify"
        "polkit"
        "ripdrag"
        "scrcpy"
        "swww"
        "variety"
        "xclip"
        "xcolor"
        "xdragon"
        "zenity"
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
        "mouse-actions"
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
      value = {
        colorScheme = inputs.nix-colors.colorSchemes.gigavolt;
        xdg.portal = enabled // {
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
          config.common.default = "*";
        };
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
)
