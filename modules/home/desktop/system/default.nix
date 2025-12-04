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
        lib
        host
        ;
    in
    {
      inputPkgs = p: [ p.ulauncher.packages."${pkgs.system}".default ];
      myPkgs = "hyprkan";
      nixX86Pkgs = "rustdesk";
      nixPkgs = [
        # keep-sorted start
        "blobdrop"
        "brightnessctl"
        "fuzzel"
        "hardinfo2"
        "libnotify"
        "polkit"
        "qtscrcpy"
        "ripdrag"
        "scrcpy"
        "swww"
        "variety"
        "xclip"
        "xcolor"
        "dragon-drop"
        "xmagnify"
        "zenity"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
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
        "xsel"
        # keep-sorted end
      ]
      ++ lib.optional (host != "office1") "deskflow";
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
