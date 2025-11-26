args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        host
        lib
        namespace
        enabled
        disabled
        pkgs
        ;
      theme = config.colorScheme.palette;
      screenScale = if host == "surface" then "1.600000" else "1";
      inherit (config.${namespace}.user) terminal;
      borderAnim = false;
      modifier = "SUPER";
    in
    {
      value = {
        wayland.windowManager.hyprland = enabled // {
          xwayland = enabled;
          systemd = disabled; # mess with path
          plugins = with pkgs.hyprlandPlugins; [ hyprsplit ];
          settings = {
            monitor = ",preferred,auto,${screenScale}";
            windowrule = [
              "float, ^(steam)$"
              "size 1080 900, ^(steam)$"
              "center, ^(steam)$"
            ];
            general = {
              gaps_in = 6;
              gaps_out = 8;
              border_size = 2;
              "col.active_border" =
                lib.mkDefault "rgba(${theme.base0C}ff) rgba(${theme.base0D}ff) rgba(${theme.base0B}ff) rgba(${theme.base0E}ff) 45deg";
              "col.inactive_border" = lib.mkDefault "rgba(${theme.base00}cc) rgba(${theme.base01}cc) 45deg";
              layout = "dwindle";
              resize_on_border = true;
            };
            input = {
              follow_mouse = 1;
              touchpad = {
                natural_scroll = false;
              };
              sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
              accel_profile = "flat";
            };
            env = [
              "NIXOS_OZONE_WL, 1"
              "NIXPKGS_ALLOW_UNFREE, 1"
              "XDG_CURRENT_DESKTOP, Hyprland"
              "XDG_SESSION_TYPE, wayland"
              "XDG_SESSION_DESKTOP, Hyprland"
              "GDK_BACKEND, wayland"
              "CLUTTER_BACKEND, wayland"
              "QT_QPA_PLATFORM, wayland"
              "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
              "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
              "MOZ_ENABLE_WAYLAND, 1"
            ];
            gestures = {
              workspace_swipe = true;
              workspace_swipe_fingers = 3;
            };
            misc = {
              mouse_move_enables_dpms = true;
              key_press_enables_dpms = false;
            };
            animations = {
              enabled = "yes";
              bezier = [
                "wind, 0.05, 0.9, 0.1, 1.05"
                "winIn, 0.1, 1.1, 0.1, 1.1"
                "winOut, 0.3, -0.3, 0, 1"
                "liner, 1, 1, 1, 1"
              ];
              animation = [
                "windows, 1, 6, wind, slide"
                "windowsIn, 1, 6, winIn, slide"
                "windowsOut, 1, 5, winOut, slide"
                "windowsMove, 1, 5, wind, slide"
                "border, 1, 1, liner"
                "fade, 1, 10, default"
                "workspaces, 1, 5, wind"
              ]
              ++ lib.optional borderAnim "borderangle, 1, 30, liner, loop";
            };
            decoration = {
              rounding = 10;
              blur = {
                enabled = true;
                size = 5;
                passes = 3;
                new_optimizations = "on";
                ignore_opacity = "on";
              };
            };
            plugin = {
              hyprtrails = {
                color = "rgba(${theme.base0A}ff)";
              };
            };
            exec-once = [
              "$POLKIT_BIN"
              "dbus-update-activation-environment --systemd --all"
              "systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
              "${lib.getExe pkgs.swayidle} -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'"
            ];
            dwindle = {
              pseudotile = true;
              preserve_split = true;
            };
            master = {
              new_on_top = true;
            };
            bind = [
              "${modifier}, Return,exec,${terminal}"
              "${modifier} SHIFT, S,exec,swaync-client -rs"
              "${modifier}, S,exec,screenshootin"
              "${modifier} SHIFT, G,exec,godot4"
              "${modifier}, D,exec,${lib.getExe pkgs.rofi-wayland} -show drun"
              "${modifier}, A,exec,playerctl play-pause"
              "${modifier}, P,pseudo,"
              "${modifier} SHIFT, I,togglesplit,"
              "${modifier}, F,fullscreen,"
              "${modifier} SHIFT, F,togglefloating,"
              "${modifier} SHIFT, C,killactive,"
              "${modifier} SHIFT, left,movewindow,l"
              "${modifier} SHIFT, right,movewindow,r"
              "${modifier} SHIFT, up,movewindow,u"
              "${modifier} SHIFT, down,movewindow,d"
              "${modifier} SHIFT, h,movewindow,l"
              "${modifier} SHIFT, l,movewindow,r"
              "${modifier} SHIFT, k,movewindow,u"
              "${modifier} SHIFT, j,movewindow,d"
              "${modifier}, left,movefocus,l"
              "${modifier}, right,movefocus,r"
              "${modifier}, up,movefocus,u"
              "${modifier}, down,movefocus,d"
              "${modifier}, h,movefocus,l"
              "${modifier}, l,movefocus,r"
              "${modifier}, k,movefocus,u"
              "${modifier}, j,movefocus,d"
              "${modifier} CONTROL, right,workspace,e+1"
              "${modifier} CONTROL, left,workspace,e-1"
              "${modifier}, mouse_down,workspace, e+1"
              "${modifier}, mouse_up,workspace, e-1"
              "${modifier}, Tab,cyclenext"
              "${modifier}, Tab,bringactivetotop"
              ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
              ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
              ", XF86AudioPlay, exec, playerctl play-pause"
              ", XF86AudioPause, exec, playerctl play-pause"
              ", XF86AudioNext, exec, playerctl next"
              ", XF86AudioPrev, exec, playerctl previous"
              ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
              ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
              "${modifier}, 0, split:workspace, 0"
              "${modifier}, 1, split:workspace, 1"
              "${modifier}, 2, split:workspace, 2"
              "${modifier}, 3, split:workspace, 3"
              "${modifier}, 4, split:workspace, 4"
              "${modifier}, 5, split:workspace, 5"
              "${modifier}, 6, split:workspace, 6"
              "${modifier}, 7, split:workspace, 7"
              "${modifier}, 8, split:workspace, 8"
              "${modifier}, 9, split:workspace, 9"
              "${modifier} SHIFT, 0, split:movetoworkspacesilent, 0"
              "${modifier} SHIFT, 1, split:movetoworkspacesilent, 1"
              "${modifier} SHIFT, 2, split:movetoworkspacesilent, 2"
              "${modifier} SHIFT, 3, split:movetoworkspacesilent, 3"
              "${modifier} SHIFT, 4, split:movetoworkspacesilent, 4"
              "${modifier} SHIFT, 5, split:movetoworkspacesilent, 5"
              "${modifier} SHIFT, 6, split:movetoworkspacesilent, 6"
              "${modifier} SHIFT, 7, split:movetoworkspacesilent, 7"
              "${modifier} SHIFT, 8, split:movetoworkspacesilent, 8"
              "${modifier} SHIFT, 9, split:movetoworkspacesilent, 9"
            ];
            bindm = [
              "${modifier}, mouse:272,movewindow"
              "${modifier}, mouse:273,resizewindow"
            ];
            binde = [ ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
          };
        };
      };
      nixPkgs = "wl-clipboard";
      progs = "swaylock";
    }
  )
)
