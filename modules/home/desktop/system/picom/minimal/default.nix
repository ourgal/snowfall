{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) enableOpt disableOpt;
    in
    {
      path = ./.;
      servs = {
        picom = {
          settings =
            enableOpt [
              "shadow"
              "fading"
              "vsync"
              "mark-wmwin-focused"
              "mark-ovredir-focused"
              "detect-rounded-corners"
              "detect-client-opacity"
              "detect-transient"
              "glx-no-stencil"
              "use-damage"
            ]
            // disableOpt [ "inactive-opacity-override" ]
            // {
              shadow-radius = 7;
              shadow-offset-x = -7;
              shadow-offset-y = -7;
              shadow-exclude = [
                "name = 'Notification'"
                "class_g = 'Conky'"
                "class_g ?= 'Notify-osd'"
                "class_g = 'Cairo-clock'"
                "_GTK_FRAME_EXTENTS@:c"
              ];
              fade-in-step = 3.0e-2;
              fade-out-step = 3.0e-2;
              fade-delta = 5;
              inactive-opacity = 1;
              frame-opacity = 0.9;
              focus-exclude = [ "class_g = 'Cairo-clock'" ];
              corner-radius = 0;
              rounded-corners-exclude = [
                "window_type = 'dock'"
                "window_type = 'desktop'"
              ];
              blur-kern = "3x3box";
              blur-background-exclude = [
                "window_type = 'dock'"
                "window_type = 'desktop'"
                "_GTK_FRAME_EXTENTS@:c"
              ];
              backend = "xrender";
              log-level = "warn";
              wintypes = {
                tooltip =
                  enableOpt [
                    "fade"
                    "shadow"
                    "focus"
                  ]
                  // disableOpt [ "full-shadow" ]
                  // {
                    opacity = 0.75;
                  };
                dock = enableOpt [ "shadow" ] // disableOpt [ "clip-shadow-above" ];
                dnd = disableOpt [ "shadow" ];
                popup_menu = {
                  opacity = 0.8;
                };
                dropdown_menu = {
                  opacity = 0.8;
                };
              };
            };
        };
      };
    }
  )
)
