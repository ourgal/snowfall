{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    servs = {
      picom = {
        settings = {
          shadow = true;
          shadow-radius = 10;
          shadow-offset-x = -10;
          shadow-offset-y = -10;
          shadow-opacity = 0.35;
          shadow-red = 0.0;
          shadow-green = 0.0;
          shadow-blue = 0.0;
          fading = true;
          fade-delta = 4;
          fade-in-step = 5.0e-2;
          fade-out-step = 5.0e-2;
          shadow-ignore-shaped = false;
          frame-opacity = 1.0;
          inactive-opacity-override = false;
          wintypes = {
            popup_menu = {
              opacity = 1.0;
            };
            dropdown_menu = {
              opacity = 1.0;
            };
            dnd = {
              shadow = false;
            };
            dock = {
              shadow = true;
            };
            tooltip = {
              fade = true;
              shadow = true;
              opacity = 1.0;
              focus = true;
            };
          };
          corner-radius = 7;
          rounded-corners-exclude = [ "class_g = 'awesome'" ];
          blur-size = 12;
          blur-strength = 5;
          blur-background = true;
          blur-background-fixed = true;
          blur-kern = "3x3box";
          blur-background-exclude = [ "window_type != 'splash'" ];
          transition = true;
          transition-offset = 25;
          transition-direction = "smart-x";
          transition-timing-function = "ease-out-cubic";
          transition-step = 2.8e-2;
          transition-rule = [ ];
        };
      };
    };
  }
)
