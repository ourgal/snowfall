{ pkgs, toTOML, ... }:
{
  home.packages = [ pkgs.helix ];
  xdg.configFile."helix/config.toml".text = toTOML {
    theme = "catppuccin_mocha";
    editor = {
      bufferline = "multiple";
      color-modes = true;
      idle-timeout = 0;
      line-number = "relative";
      popup-border = "none";
      true-color = true;
      auto-save = true;
      cursor-shape = {
        insert = "bar";
      };
      indent-guides = {
        character = "⸽";
        render = true;
        skip-levels = 1;
      };
      lsp = {
        display-inlay-hints = true;
        display-messages = true;
      };
      soft-wrap = {
        enable = true;
      };
      statusline = {
        center = [ "file-name" ];
        left = [
          "mode"
          "spinner"
        ];
        right = [
          "diagnostics"
          "selections"
          "position"
          "file-encoding"
          "file-line-ending"
          "file-type"
        ];
        separator = "│";
        mode = {
          insert = "INSERT";
          normal = "NORMAL";
          select = "SELECT";
        };
      };
    };
    keys = {
      normal = {
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        A-v = "extend_line_above";
        C-h = "jump_view_left";
        C-j = "jump_view_down";
        C-k = "jump_view_up";
        C-l = "jump_view_right";
        G = "goto_last_line";
        V = "extend_line_below";
        "^" = "goto_first_nonwhitespace";
        backspace = "trim_selections";
        esc = "collapse_selection";
        Z = {
          Q = ":qa!";
          Z = ":xa";
        };
        "[" = {
          b = ":buffer-previous";
        };
        "]" = {
          b = ":buffer-next";
        };
        g = {
          z = [
            "split_selection_on_newline"
            ":sort"
            "keep_primary_selection"
          ];
          c = {
            b = "toggle_block_comments";
            c = "toggle_comments";
            l = "toggle_line_comments";
          };
          e = { };
          h = { };
          l = { };
          s = { };
        };
        space = {
          "/" = "global_search";
          O = "workspace_symbol_picker";
          f = "file_picker";
          o = "symbol_picker";
          P = { };
          R = { };
          S = { };
          Y = { };
          l = {
            f = ":fmt";
          };
          p = { };
          s = { };
          y = { };
        };
      };
      select = {
        "0" = "goto_line_start";
        "$" = "goto_line_end";
        "?" = "split_selection";
        A-d = "delete_selection";
        G = "goto_file_end";
        "^" = "goto_first_nonwhitespace";
        backspace = "trim_selections";
        esc = [
          "normal_mode"
          "collapse_selection"
        ];
        g = {
          c = "toggle_comments";
          z = [
            "split_selection_on_newline"
            ":sort"
            "keep_primary_selection"
          ];
          e = { };
          h = { };
          l = { };
          s = { };
        };
        space = {
          "/" = "global_search";
          O = "workspace_symbol_picker";
          f = "file_picker";
          o = "symbol_picker";
          P = { };
          R = { };
          S = { };
          Y = { };
          l = { };
          p = { };
          s = { };
          y = { };
        };
      };
    };
  };
}
