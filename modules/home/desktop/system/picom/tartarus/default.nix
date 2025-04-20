args:
args.module (
  args
  // {
    servs = {
      picom = {
        settings = {
          shadow = false;
          fading = true;
          fade-in-step = 1.8e-2;
          fade-out-step = 3.0e-2;
          fade-delta = 4;
          inactive-opacity = 0.95;
          frame-opacity = 1.0;
          active-opacity = 1.0;
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
          backend = "glx";
          vsync = false;
          mark-wmwin-focused = true;
          mark-ovredir-focused = true;
          detect-rounded-corners = false;
          detect-client-opacity = true;
          refresh-rate = 0;
          detect-transient = false;
          use-damage = true;
          log-level = "warn";
        };
      };
    };
  }
)
