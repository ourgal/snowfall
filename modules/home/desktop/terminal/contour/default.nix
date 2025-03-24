args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "contour";
    confs = {
      "contour/contour.yml" = {
        platform_plugin = "auto";
        renderer = {
          backend = "OpenGL";
          tile_hashtable_slots = 4096;
          tile_cache_count = 4000;
          tile_direct_mapping = true;
        };
        word_delimiters = " /\\()\"'-.,:;<>~!@#$%^&*+=[]{}~?|│";
        read_buffer_size = 16384;
        pty_buffer_size = 1048576;
        default_profile = "main";
        spawn_new_process = false;
        reflow_on_resize = true;
        bypass_mouse_protocol_modifier = "Shift";
        mouse_block_selection_modifier = "Control";
        on_mouse_select = "CopyToSelectionClipboard";
        live_config = true;
        images = {
          sixel_scrolling = true;
          sixel_register_count = 4096;
          max_width = 0;
          max_height = 0;
        };
        profiles = {
          main = {
            escape_sandbox = true;
            copy_last_mark_range_offset = 0;
            initial_working_directory = "~";
            show_title_bar = true;
            size_indicator_on_resize = true;
            fullscreen = false;
            maximized = false;
            bell = {
              sound = "default";
              alert = true;
            };
            wm_class = "contour";
            option_as_alt = false;
            terminal_id = "VT525";
            frozen_dec_modes = {
              "2026" = false;
            };
            slow_scrolling_time = 100;
            terminal_size = {
              columns = 80;
              lines = 25;
            };
            history = {
              limit = 1000;
              auto_scroll_on_update = true;
              scroll_multiplier = 3;
            };
            scrollbar = {
              position = "Hidden";
              hide_in_alt_screen = true;
            };
            mouse = {
              hide_while_typing = true;
            };
            permissions = {
              change_font = "ask";
              capture_buffer = "ask";
              display_host_writable_statusline = "ask";
            };
            highlight_word_and_matches_on_double_click = true;
            font = {
              size = 14;
              locator = "native";
              text_shaping = {
                engine = "native";
              };
              builtin_box_drawing = true;
              render_mode = "lcd";
              strict_spacing = true;
              regular = {
                family = "Maple Mono SC NF";
                weight = "medium";
                slant = "normal";
                features = [ ];
              };
              emoji = "emoji";
            };
            draw_bold_text_with_bright_colors = true;
            cursor = {
              shape = "block";
              blinking = false;
              blinking_interval = 500;
            };
            normal_mode = {
              cursor = {
                shape = "block";
                blinking = false;
                blinking_interval = 500;
              };
            };
            visual_mode = {
              cursor = {
                shape = "block";
                blinking = false;
                blinking_interval = 500;
              };
            };
            vi_mode_highlight_timeout = 300;
            vi_mode_scrolloff = 8;
            status_line = {
              display = "none";
              position = "bottom";
              sync_to_window_title = false;
            };
            background = {
              opacity = 0.7;
              blur = false;
            };
            colors = {
              light = "default";
              dark = "default";
            };
            hyperlink_decoration = {
              normal = "dotted";
              hover = "underline";
            };
          };
        };
        color_schemes = {
          default = {
            default = {
              background = "#1a1716";
              foreground = "#d0d0d0";
            };
            background_image = {
              opacity = 0.5;
              blur = false;
            };
            cursor = {
              default = "CellForeground";
              text = "CellBackground";
            };
            hyperlink_decoration = {
              normal = "#f0f000";
              hover = "#ff0000";
            };
            vi_mode_highlight = {
              foreground = "CellForeground";
              foreground_alpha = 1;
              background = "#ffa500";
              background_alpha = 0.5;
            };
            vi_mode_cursorline = {
              foreground = "#ffffff";
              foreground_alpha = 0.2;
              background = "#808080";
              background_alpha = 0.4;
            };
            selection = {
              foreground = "CellForeground";
              foreground_alpha = 1;
              background = "#4040f0";
              background_alpha = 0.5;
            };
            search_highlight = {
              foreground = "CellBackground";
              background = "CellForeground";
              foreground_alpha = 1;
              background_alpha = 1;
            };
            search_highlight_focused = {
              foreground = "CellBackground";
              background = "CellForeground";
              foreground_alpha = 1;
              background_alpha = 1;
            };
            word_highlight_current = {
              foreground = "CellForeground";
              background = "#909090";
              foreground_alpha = 1;
              background_alpha = 0.5;
            };
            word_highlight_other = {
              foreground = "CellForeground";
              background = "#909090";
              foreground_alpha = 1;
              background_alpha = 0.5;
            };
            indicator_statusline = {
              foreground = "#808080";
              background = "#000000";
            };
            indicator_statusline_inactive = {
              foreground = "#808080";
              background = "#000000";
            };
            input_method_editor = {
              foreground = "#FFFFFF";
              background = "#FF0000";
            };
            normal = {
              black = "#000000";
              red = "#c63939";
              green = "#00a000";
              yellow = "#a0a000";
              blue = "#4d79ff";
              magenta = "#ff66ff";
              cyan = "#00a0a0";
              white = "#c0c0c0";
            };
            bright = {
              black = "#707070";
              red = "#ff0000";
              green = "#00ff00";
              yellow = "#ffff00";
              blue = "#0000ff";
              magenta = "#ff00ff";
              cyan = "#00ffff";
              white = "#ffffff";
            };
          };
        };
        input_mapping = [
          {
            mods = [ "Control" ];
            mouse = "Left";
            action = "FollowHyperlink";
          }
          {
            mods = [ ];
            mouse = "Middle";
            action = "PasteSelection";
          }
          {
            mods = [ ];
            mouse = "WheelDown";
            action = "ScrollDown";
          }
          {
            mods = [ ];
            mouse = "WheelUp";
            action = "ScrollUp";
          }
          {
            mods = [ "Alt" ];
            key = "Enter";
            action = "ToggleFullscreen";
          }
          {
            mods = [ "Alt" ];
            mouse = "WheelDown";
            action = "DecreaseOpacity";
          }
          {
            mods = [ "Alt" ];
            mouse = "WheelUp";
            action = "IncreaseOpacity";
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = "S";
            action = "ScreenshotVT";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "Plus";
            action = "IncreaseFontSize";
          }
          {
            mods = [ "Control" ];
            key = "0";
            action = "ResetFontSize";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "Minus";
            action = "DecreaseFontSize";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "_";
            action = "DecreaseFontSize";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "N";
            action = "NewTerminal";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "V";
            action = "PasteClipboard";
            strip = false;
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = "V";
            action = "PasteClipboard";
            strip = true;
          }
          {
            mods = [ "Control" ];
            key = "C";
            action = "CopySelection";
            mode = "Select|Insert";
          }
          {
            mods = [ "Control" ];
            key = "C";
            action = "CancelSelection";
            mode = "Select|Insert";
          }
          {
            mods = [ "Control" ];
            key = "V";
            action = "PasteClipboard";
            strip = false;
            mode = "Select|Insert";
          }
          {
            mods = [ "Control" ];
            key = "V";
            action = "CancelSelection";
            mode = "Select|Insert";
          }
          {
            mods = [ ];
            key = "Escape";
            action = "CancelSelection";
            mode = "Select|Insert";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "Space";
            action = "ViNormalMode";
            mode = "Insert";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "Comma";
            action = "OpenConfiguration";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "Q";
            action = "Quit";
          }
          {
            mods = [ "Control" ];
            mouse = "WheelDown";
            action = "DecreaseFontSize";
          }
          {
            mods = [ "Control" ];
            mouse = "WheelUp";
            action = "IncreaseFontSize";
          }
          {
            mods = [ "Shift" ];
            key = "DownArrow";
            action = "ScrollOneDown";
          }
          {
            mods = [ "Shift" ];
            key = "End";
            action = "ScrollToBottom";
          }
          {
            mods = [ "Shift" ];
            key = "Home";
            action = "ScrollToTop";
          }
          {
            mods = [ "Shift" ];
            key = "PageDown";
            action = "ScrollPageDown";
          }
          {
            mods = [ "Shift" ];
            key = "PageUp";
            action = "ScrollPageUp";
          }
          {
            mods = [ "Shift" ];
            key = "UpArrow";
            action = "ScrollOneUp";
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = "K";
            action = "ScrollMarkUp";
            mode = "~Alt";
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = "J";
            action = "ScrollMarkDown";
            mode = "~Alt";
          }
          {
            mods = [ "Shift" ];
            mouse = "WheelDown";
            action = "ScrollPageDown";
          }
          {
            mods = [ "Shift" ];
            mouse = "WheelUp";
            action = "ScrollPageUp";
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = "O";
            action = "OpenFileManager";
          }
          {
            mods = [
              "Control"
              "Alt"
            ];
            key = ".";
            action = "ToggleStatusLine";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "F";
            action = "SearchReverse";
          }
          {
            mods = [
              "Control"
              "Shift"
            ];
            key = "H";
            action = "NoSearchHighlight";
          }
          {
            mods = [ ];
            key = "F3";
            action = "FocusNextSearchMatch";
          }
          {
            mods = [ "Shift" ];
            key = "F3";
            action = "FocusPreviousSearchMatch";
          }
        ];
      };
    };
  }
)
