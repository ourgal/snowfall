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
      inputPkgs = p: [ p.ulauncher.packages."${pkgs.system}".default ];
      nixPkgs = [
        # keep-sorted start
        "blobdrop"
        "brightnessctl"
        "deskflow"
        "fuzzel"
        "hardinfo2"
        "libnotify"
        "polkit"
        "qtscrcpy"
        "ripdrag"
        "rustdesk"
        "scrcpy"
        "swww"
        "variety"
        "xclip"
        "xcolor"
        "xdragon"
        "xmagnify"
        "xsel"
        "zenity"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "barrier"
        "clipboard"
        "cursor"
        "dunst"
        "espanso"
        "flameshot"
        "gammastep"
        "gtk"
        "kdeconnect"
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
        "volnoti"
        "xbanish"
        # keep-sorted end
      ];
      value = {
        colorScheme = inputs.nix-colors.colorSchemes.gigavolt;
        xdg.portal = enabled // {
          extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
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
