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
      nixPkgs = [
        # keep-sorted start
        "brightnessctl"
        "dragon-drop"
        "fuzzel"
        "libnotify"
        "ripdrag"
        "scrcpy"
        "swww"
        "xclip"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
        "cursor"
        "dunst"
        "espanso"
        "flameshot"
        "gammastep"
        "gtk"
        "kdeconnect"
        "maim"
        "picom"
        "playerctl"
        "qt"
        "redshift"
        "rofi"
        "sbsrf"
        "xbanish"
        "xsel"
        # keep-sorted end
      ]
      ++ lib.optional (host != "office1") "deskflow";
      value = {
        colorScheme = inputs.nix-colors.colorSchemes.gigavolt;
        xdg.portal = enabled // {
          config.common.default = "kde";
          extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
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
