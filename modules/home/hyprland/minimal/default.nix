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
        pkgs
        ;
      theme = config.colorScheme.palette;
      screenScale = if host == "surface" then "1.600000" else "1";
      inherit (config.${namespace}.user) terminal;
      borderAnim = false;
      modifier = "SUPER";
    in
    {
      path = ./.;
      value = {
        wayland.windowManager.hyprland = enabled // {
          xwayland = enabled;
          systemd = enabled;
          plugins = [
            # hyprplugins.hyprtrails
          ];
          extraConfig = lib.concatStrings [
            ''
              monitor=,preferred,auto,${screenScale}
              windowrule = float, ^(steam)$
              windowrule = size 1080 900, ^(steam)$
              windowrule = center, ^(steam)$
              general {
                gaps_in = 6
                gaps_out = 8
                border_size = 2
                col.active_border = rgba(${theme.base0C}ff) rgba(${theme.base0D}ff) rgba(${theme.base0B}ff) rgba(${theme.base0E}ff) 45deg
                col.inactive_border = rgba(${theme.base00}cc) rgba(${theme.base01}cc) 45deg
                layout = dwindle
                resize_on_border = true
              }

              input {
                follow_mouse = 1
                touchpad {
                  natural_scroll = false
                }
                sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
                accel_profile = flat
              }
              env = NIXOS_OZONE_WL, 1
              env = NIXPKGS_ALLOW_UNFREE, 1
              env = XDG_CURRENT_DESKTOP, Hyprland
              env = XDG_SESSION_TYPE, wayland
              env = XDG_SESSION_DESKTOP, Hyprland
              env = GDK_BACKEND, wayland
              env = CLUTTER_BACKEND, wayland
              env = QT_QPA_PLATFORM, wayland
              env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
              env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
              env = MOZ_ENABLE_WAYLAND, 1
              gestures {
                workspace_swipe = true
                workspace_swipe_fingers = 3
              }
              misc {
                mouse_move_enables_dpms = true
                key_press_enables_dpms = false
              }
              animations {
                enabled = yes
                bezier = wind, 0.05, 0.9, 0.1, 1.05
                bezier = winIn, 0.1, 1.1, 0.1, 1.1
                bezier = winOut, 0.3, -0.3, 0, 1
                bezier = liner, 1, 1, 1, 1
                animation = windows, 1, 6, wind, slide
                animation = windowsIn, 1, 6, winIn, slide
                animation = windowsOut, 1, 5, winOut, slide
                animation = windowsMove, 1, 5, wind, slide
                animation = border, 1, 1, liner
                ${
                  if borderAnim then
                    ''
                      animation = borderangle, 1, 30, liner, loop
                    ''
                  else
                    ""
                }
                animation = fade, 1, 10, default
                animation = workspaces, 1, 5, wind
              }
              decoration {
                rounding = 10
                drop_shadow = false
                blur {
                    enabled = true
                    size = 5
                    passes = 3
                    new_optimizations = on
                    ignore_opacity = on
                }
              }
              plugin {
                hyprtrails {
                  color = rgba(${theme.base0A}ff)
                }
                split-monitor-workspaces {
                  count = 5
                  keep_focused = 0
                  enable_notifications = 0
                  enable_persistent_workspaces = 1
                }
              }
              exec-once = $POLKIT_BIN
              exec-once = dbus-update-activation-environment --systemd --all
              exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
              ${if config.${namespace}.desktop.system.waybar.hyprland.enable then "exec-once = waybar" else ""}
              exec-once = ${pkgs.${namespace}.swww-wallsetter}/bin/swww-wallsetter
              exec-once = ${pkgs.swayidle}/bin/swayidle -w timeout 720 'swaylock -f' timeout 800 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' before-sleep 'swaylock -f -c 000000'
              dwindle {
                pseudotile = true
                preserve_split = true
              }
              master {
                new_on_top = true
              }
              bind = ${modifier}, Return,exec,${terminal}
              bind = ${modifier} SHIFT, S,exec,swaync-client -rs
              bind = ${modifier}, S,exec,screenshootin
              bind = ${modifier} SHIFT, G,exec,godot4
              bind = ${modifier}, D,exec,${pkgs.rofi-wayland}/bin/rofi -show drun
              bind = ${modifier}, A,exec,playerctl play-pause
              bind = ${modifier}, P,pseudo,
              bind = ${modifier} SHIFT, I,togglesplit,
              bind = ${modifier}, F,fullscreen,
              bind = ${modifier} SHIFT, F,togglefloating,
              bind = ${modifier} SHIFT, C,killactive,
              bind = ${modifier} SHIFT, left,movewindow,l
              bind = ${modifier} SHIFT, right,movewindow,r
              bind = ${modifier} SHIFT, up,movewindow,u
              bind = ${modifier} SHIFT, down,movewindow,d
              bind = ${modifier} SHIFT, h,movewindow,l
              bind = ${modifier} SHIFT, l,movewindow,r
              bind = ${modifier} SHIFT, k,movewindow,u
              bind = ${modifier} SHIFT, j,movewindow,d
              bind = ${modifier}, left,movefocus,l
              bind = ${modifier}, right,movefocus,r
              bind = ${modifier}, up,movefocus,u
              bind = ${modifier}, down,movefocus,d
              bind = ${modifier}, h,movefocus,l
              bind = ${modifier}, l,movefocus,r
              bind = ${modifier}, k,movefocus,u
              bind = ${modifier}, j,movefocus,d

              bind = ${modifier}, 1,workspace,1
              bind = ${modifier}, 2,workspace,2
              bind = ${modifier}, 3,workspace,3
              bind = ${modifier}, 4,workspace,4
              bind = ${modifier}, 5,workspace,5
              bind = ${modifier}, 6,workspace,6
              bind = ${modifier}, 7,workspace,7
              bind = ${modifier}, 8,workspace,8
              bind = ${modifier}, 9,workspace,9
              bind = ${modifier}, 0,workspace,10
              bind = ${modifier} SHIFT, 1,movetoworkspace,1
              bind = ${modifier} SHIFT, 2,movetoworkspace,2
              bind = ${modifier} SHIFT, 3,movetoworkspace,3
              bind = ${modifier} SHIFT, 4,movetoworkspace,4
              bind = ${modifier} SHIFT, 5,movetoworkspace,5
              bind = ${modifier} SHIFT, 6,movetoworkspace,6
              bind = ${modifier} SHIFT, 7,movetoworkspace,7
              bind = ${modifier} SHIFT, 8,movetoworkspace,8
              bind = ${modifier} SHIFT, 9,movetoworkspace,9
              bind = ${modifier} SHIFT, 0,movetoworkspace,10

              bind = ${modifier} CONTROL, right,workspace,e+1
              bind = ${modifier} CONTROL, left,workspace,e-1
              bind = ${modifier}, mouse_down,workspace, e+1
              bind = ${modifier}, mouse_up,workspace, e-1
              bindm = ${modifier}, mouse:272,movewindow
              bindm = ${modifier}, mouse:273,resizewindow
              bind = ${modifier}, Tab,cyclenext
              bind = ${modifier}, Tab,bringactivetotop
              bind = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
              bind = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
              binde = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
              bind = , XF86AudioPlay, exec, playerctl play-pause
              bind = , XF86AudioPause, exec, playerctl play-pause
              bind = , XF86AudioNext, exec, playerctl next
              bind = , XF86AudioPrev, exec, playerctl previous
              bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
              bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%
            ''
          ];
        };
      };
      nixPkgs = "wl-clipboard";
      progs = "swaylock";
    }
  )
)
