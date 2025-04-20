args:
args.module (
  args
  // (
    let
      inherit (args) enableOpt disableOpt;
    in
    {
      servs = {
        picom = {
          settings =
            enableOpt [
              "shadow"
              "xinerama-shadow-crop"
              "fading"
              "no-fading-destroyed-argb"
              "use-damage"
              "vsync"
              "detect-rounded-corners"
              "detect-client-leader"
              "detect-transient"
              "unredir-if-possible"
            ]
            // disableOpt [
              "shadow-ignore-shaped"
              "no-fading-openclose"
              "glx-no-stencil"
              "glx-copy-from-front"
            ]
            // {
              corner-radius = 12;
              rounded-corners-exclude = [
                # "class_g ?= 'rofi'"
                "class_g ?= 'peek'"
                "window_type *= 'dock'"
                "window_type = 'menu'"
                "window_type = 'tooltip'"
                # "window_type = 'popup_menu'"
                "window_type = 'dropdown_menu'"
              ];
              shadow-radius = 12;
              shadow-opacity = 0.6;
              shadow-offset-x = -12;
              shadow-offset-y = -12;
              shadow-color = "#000000";
              shadow-exclude = [
                "class_g = 'slop'"
                "class_g ?= 'peek'"
                "_NET_WM_WINDOW_TYPE@:a *= 'SPLASH'"
                # "_NET_WM_WINDOW_TYPE@:a *= 'NOTIFICATION'"
                # "window_type *= 'menu'"
                "window_type = 'utility'"
                "window_type = 'dropdown_menu'"
                # "window_type = 'popup_menu'"
              ];
              fade-in-step = 3.0e-2;
              fade-out-step = 3.0e-2;
              fade-delta = 5;
              fade-exclude = [
                "class_g = 'slop'" # maim
              ];
              active-opacity = 1.0;
              inactive-opacity = 1.0;
              frame-opacity = 1.0;
              inactive-dim = 0.0;
              opacity-rule = [ ];
              focus-exclude = [
                #"class_g ?= 'rofi'"
                #'_NET_WM_NAME@:s = "rofi"'
                "class_g ?= 'slop'"
                "name = 'rofi'"
                "class_g ?= 'Steam'"
                "_NET_WM_WINDOW_TYPE@:a *= 'MENU'"
                "window_type *= 'menu'"
                "window_type = 'utility'"
                "window_type = 'dropdown_menu'"
                "window_type = 'popup_menu'"
              ];
              blur =
                enableOpt [
                  "background-frame"
                  "background-fixed"
                ]
                // disableOpt [ "background" ]
                // {
                  method = "dual_kawase";
                  strength = 10;
                };
              blur-background-exclude = [
                # Exclude everything except windows of type "splash"
                # (Notice the inverse condition)
                "window_type != 'splash'"
              ];

              backend = "glx";

              wintypes =
                let
                  enableFullShadow =
                    opts: builtins.foldl' (acc: opt: acc // { "${opt}".full-shadow = true; }) { } opts;
                in
                enableFullShadow [
                  "tooltip"
                  "menu"
                  "popup_menu"
                  "utility"
                  "toolbar"
                  "normal"
                  "notification"
                  "dialog"
                  "dock"
                  "dropdown_menu"
                ]
                // {
                  tooltip =
                    enableOpt [
                      "fade"
                      "focus"
                    ]
                    // disableOpt [ "blur-background" ];
                };
            };
        };
      };
    }
  )
)
