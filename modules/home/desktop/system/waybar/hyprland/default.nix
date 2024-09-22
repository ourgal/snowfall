{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        cfgHome
        switch
        lib
        ;
      cfg = cfgHome config.${namespace} ./.;
      palette = config.colorScheme.palette;
    in
    {
      path = ./.;
      progs = {
        waybar = {
          settings = [
            {
              layer = "top";
              position = "top";

              modules-center =
                if cfg.simplebar == true then
                  [ "hyprland/window" ]
                else
                  [
                    "network"
                    "pulseaudio"
                    "cpu"
                    "hyprland/workspaces"
                    "memory"
                    "disk"
                    "clock"
                  ];
              modules-left =
                if cfg.simplebar == true then
                  [
                    "custom/startmenu"
                    "hyprland/workspaces"
                    "cpu"
                    "memory"
                    "network"
                  ]
                else
                  [
                    "custom/startmenu"
                    "hyprland/window"
                  ];
              modules-right =
                if cfg.simplebar == true then
                  [
                    "idle_inhibitor"
                    "custom/themeselector"
                    "custom/notification"
                    "pulseaudio"
                    "clock"
                    "tray"
                  ]
                else
                  [
                    "idle_inhibitor"
                    "custom/themeselector"
                    "custom/notification"
                    "battery"
                    "tray"
                  ];

              "hyprland/workspaces" = {
                format = if cfg.simplebar == true then "{name}" else "{icon}";
                format-icons = {
                  default = " ";
                  active = " ";
                  urgent = " ";
                };
                on-scroll-up = "hyprctl dispatch workspace e+1";
                on-scroll-down = "hyprctl dispatch workspace e-1";
              };
              "clock" = {
                format = if cfg.clock24h == true then "{: %H:%M}" else "{: %I:%M %p}";
                tooltip = true;
                tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
              };
              "hyprland/window" = {
                max-length = 25;
                separate-outputs = false;
              };
              "memory" = {
                interval = 5;
                format = " {}%";
                tooltip = true;
              };
              "cpu" = {
                interval = 5;
                format = " {usage:2}%";
                tooltip = true;
              };
              "disk" = {
                format = " {free}";
                tooltip = true;
              };
              "network" = {
                format-icons = [
                  "󰤯"
                  "󰤟"
                  "󰤢"
                  "󰤥"
                  "󰤨"
                ];
                format-ethernet = " {bandwidthDownOctets}";
                format-wifi = "{icon} {signalStrength}%";
                format-disconnected = "󰤮";
                tooltip = false;
              };
              "tray" = {
                spacing = 12;
              };
              "pulseaudio" = {
                format = "{icon} {volume}% {format_source}";
                format-bluetooth = "{volume}% {icon} {format_source}";
                format-bluetooth-muted = " {icon} {format_source}";
                format-muted = " {format_source}";
                format-source = " {volume}%";
                format-source-muted = "";
                format-icons = {
                  headphone = "";
                  hands-free = "";
                  headset = "";
                  phone = "";
                  portable = "";
                  car = "";
                  default = [
                    ""
                    ""
                    ""
                  ];
                };
                on-click = "pavucontrol";
              };
              "custom/themeselector" = {
                tooltip = false;
                format = "";
                # exec = "theme-selector";
                on-click = "sleep 0.1 && theme-selector";
              };
              "custom/startmenu" = {
                tooltip = false;
                format = " ";
                # exec = "rofi -show drun";
                on-click = "fuzzel";
              };
              "idle_inhibitor" = {
                format = "{icon}";
                format-icons = {
                  activated = " ";
                  deactivated = " ";
                };
                tooltip = "true";
              };
              "custom/notification" = {
                tooltip = false;
                format = "{icon} {}";
                format-icons = {
                  notification = "<span foreground='red'><sup></sup></span>";
                  none = "";
                  dnd-notification = "<span foreground='red'><sup></sup></span>";
                  dnd-none = "";
                  inhibited-notification = "<span foreground='red'><sup></sup></span>";
                  inhibited-none = "";
                  dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                  dnd-inhibited-none = "";
                };
                return-type = "json";
                exec-if = "which swaync-client";
                exec = "swaync-client -swb";
                on-click = "task-waybar";
                escape = true;
              };
              "battery" = {
                states = {
                  warning = 30;
                  critical = 15;
                };
                format = "{icon} {capacity}%";
                format-charging = "󰂄 {capacity}%";
                format-plugged = "󱘖 {capacity}%";
                format-icons = [
                  "󰁺"
                  "󰁻"
                  "󰁼"
                  "󰁽"
                  "󰁾"
                  "󰁿"
                  "󰂀"
                  "󰂁"
                  "󰂂"
                  "󰁹"
                ];
                on-click = "";
                tooltip = false;
              };
            }
          ];
          style = lib.concatStrings [
            ''
                    * {
              	font-size: 16px;
              	font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
                  	font-weight: bold;
                    }
                    window#waybar {
              	${
                 if cfg.slickbar == true then
                   "  background-color: rgba(26,27,38,0);\n  border-bottom: 1px solid rgba(26,27,38,0);\n  border-radius: 0px;\n  color: #${palette.base0F};\n"
                 else if cfg.simplebar == true then
                   "  color: #${config.colorScheme.colors.base05};\n  background-color: #${palette.base00};\n  border-radius: 0px;\n  border-bottom: 1px solid rgba(26,27,38,0);\n"
                 else
                   "  background-color: #${palette.base00};\n  border-bottom: 1px solid #${palette.base00};\n  border-radius: 0px;\n  color: #${palette.base0F};\n"
               }
                    }
                    #workspaces {
              	${
                 if cfg.slickbar == true then
                   "  background: linear-gradient(180deg, #${palette.base00}, #${palette.base01});\n  margin: 5px;\n  padding: 0px 1px;\n  border-radius: 15px;\n  border: 0px;\n  font-style: normal;\n  color: #${palette.base00};\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  border-radius: 0px;
                     	  border: 0px;
                     	  font-style: normal;
                     	''
                 else
                   "  background: linear-gradient(45deg, #${palette.base01}, #${palette.base01});\n  margin: 4px;\n  padding: 0px 1px;\n  border-radius: 10px;\n  border: 0px;\n  font-style: normal;\n  color: #${palette.base00};\n"
               }
                    }
                    #workspaces button {
              	${
                 if cfg.slickbar == true then
                   "  padding: 0px 5px;\n  margin: 4px 3px;\n  border-radius: 15px;\n  border: 0px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base0D}, #${palette.base0E});\n  opacity: 0.5;\n  transition: all 0.3s ease-in-out;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  opacity: 0.3;
                     	  border: 0px;
                     	  transition: all 0.3s ease-in-out;
                     	''
                 else
                   "  padding: 0px 5px;\n  margin: 4px 3px;\n  border-radius: 10px;\n  border: 0px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base06}, #${palette.base0E});\n  opacity: 0.5;\n  transition: all 0.3s ease-in-out;\n"
               }
                    }
                    #workspaces button.active {
              	${
                 if cfg.slickbar == true then
                   "  padding: 0px 5px;\n  margin: 4px 3px;\n  border-radius: 15px;\n  border: 0px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base0D}, #${palette.base0E});\n  opacity: 1.0;\n  min-width: 40px;\n  transition: all 0.3s ease-in-out;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  opacity: 1.0;
                     	  border: 0px;
                     	  transition: all 0.3s ease-in-out;
                     	''
                 else
                   "  padding: 0px 5px;\n  margin: 4px 3px;\n  border-radius: 10px;\n  border: 0px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base06}, #${palette.base0E});\n  opacity: 1.0;\n  min-width: 40px;\n  transition: all 0.3s ease-in-out;\n"
               }
                    }
                    #workspaces button:hover {
              	${
                 if cfg.slickbar == true then
                   "  border-radius: 15px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base0D}, #${palette.base0E});\n  opacity: 0.8;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  opacity: 0.8;
                     	  border: 0px;
                     	  transition: all 0.3s ease-in-out;
                     	''
                 else
                   "  border-radius: 10px;\n  color: #${palette.base00};\n  background: linear-gradient(45deg, #${palette.base06}, #${palette.base0E});\n  opacity: 0.8;\n"
               }
                    }
                    tooltip {
              	background: #${palette.base00};
              	border: 1px solid #${palette.base0E};
              	border-radius: 10px;
                    }
                    tooltip label {
              	color: #${palette.base07};
                    }
                    #window {
              	${
                 if cfg.slickbar == true then
                   "  color: #${palette.base05};\n  background: #${palette.base00};\n  border-radius: 50px 15px 50px 15px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  margin: 4px;\n  padding: 2px 10px;\n  color: #${palette.base05};\n  background: #${palette.base01};\n  border-radius: 10px;\n"
               }
                    }
                    #memory {
                 	color: #${palette.base0F};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #clock {
                  	color: #${palette.base0B};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #idle_inhibitor {
                  	color: #${palette.base0A};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 50px 15px 50px 15px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #cpu {
                  	color: #${palette.base07};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 50px 15px 50px 15px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #disk {
                  	color: #${palette.base03};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #battery {
                  	color: #${palette.base08};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #network {
                  	color: #${palette.base09};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 50px 15px 50px 15px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #tray {
                  	color: #${palette.base05};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 0px 0px 50px;\n  margin: 5px 0px 5px 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #pulseaudio {
                  	color: #${palette.base0D};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 50px 15px 50px 15px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #custom-notification {
                  	color: #${palette.base0C};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #custom-themeselector {
                  	color: #${palette.base0D};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #custom-startmenu {
                  	color: #${palette.base03};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 0px 15px 50px 0px;\n  margin: 5px 5px 5px 0px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    }
                    #idle_inhibitor {
                  	color: #${palette.base09};
              	${
                 if cfg.slickbar == true then
                   "  background: #${palette.base00};\n  border-radius: 15px 50px 15px 50px;\n  margin: 5px;\n  padding: 2px 20px;\n"
                 else if cfg.simplebar == true then
                   ''
                     	  color: #${config.colorScheme.colors.base05};
                               background: transparent;
                     	  margin: 4px;
                     	''
                 else
                   "  background: #${palette.base01};\n  margin: 4px;\n  padding: 2px 10px;\n  border-radius: 10px;\n"
               }
                    } ''
          ];
        };
      };
      extraOpts = {
        simplebar = switch;
        clock24h = switch;
        slickbar = switch;
      };
    }
  )
)
