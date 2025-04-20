{
  nixPkgs = "ov";
  progs.git.extraConfig = {
    delta = {
      navigate.enable = true;
      side-by-side.enable = true;
      file-yellow.enable = true;
    };
    # paper.log = "ov -F --section-delimiter '^commit' --section-header-num 3"; # 0.33.0
    paper.log = "ov -F --section-delimiter '^commit'";
  };
  confs = {
    "ov/config.yaml" = {
      General = {
        TabWidth = 8;
        Header = 0;
        AlternateRows = false;
        ColumnMode = false;
        LineNumMode = false;
        WrapMode = true;
        ColumnDelimiter = ",";
        MarkStyleWidth = 1;
      };
      StyleAlternate = {
        Background = "gray";
      };
      StyleHeader = {
        Bold = true;
      };
      StyleOverStrike = {
        Bold = true;
      };
      StyleOverLine = {
        Underline = true;
      };
      StyleLineNumber = {
        Bold = true;
      };
      StyleSearchHighlight = {
        Reverse = true;
      };
      StyleColumnHighlight = {
        Reverse = true;
      };
      StyleMarkLine = {
        Background = "darkgoldenrod";
      };
      StyleSectionLine = {
        Background = "slateblue";
      };
      StyleMultiColorHighlight = [
        { Foreground = "red"; }
        { Foreground = "aqua"; }
        { Foreground = "yellow"; }
        { Foreground = "fuchsia"; }
        { Foreground = "lime"; }
        { Foreground = "blue"; }
        { Foreground = "grey"; }
      ];
      StyleJumpTargetLine = {
        Underline = true;
      };
      KeyBind = {
        exit = [
          "Escape"
          "q"
        ];
        cancel = [ "ctrl+c" ];
        write_exit = [ "Q" ];
        set_write_exit = [ "ctrl+q" ];
        suspend = [ "ctrl+z" ];
        sync = [ "ctrl+l" ];
        reload = [
          "ctrl+alt+l"
          "F5"
        ];
        watch = [
          "ctrl+alt+w"
          "F4"
        ];
        watch_interval = [ "ctrl+w" ];
        follow_mode = [ "ctrl+f" ];
        follow_all = [ "ctrl+a" ];
        follow_section = [ "F2" ];
        help = [
          "F1"
          "ctrl+alt+c"
          "ctrl+f1"
        ];
        logdoc = [
          "ctrl+f2"
          "ctrl+alt+e"
        ];
        down = [
          "Enter"
          "Down"
          "ctrl+N"
          "j"
        ];
        up = [
          "Up"
          "ctrl+p"
          "k"
        ];
        top = [ "Home" ];
        bottom = [ "End" ];
        left = [
          "left"
          "h"
        ];
        right = [
          "right"
          "l"
        ];
        half_left = [ "ctrl+left" ];
        half_right = [ "ctrl+right" ];
        page_up = [
          "PageUp"
          "ctrl+b"
        ];
        page_down = [
          "PageDown"
          "ctrl+v"
        ];
        page_half_up = [ "ctrl+u" ];
        page_half_down = [ "ctrl+d" ];
        section_delimiter = [ "alt+d" ];
        section_start = [
          "ctrl+F3"
          "alt+s"
        ];
        next_section = [ "space" ];
        last_section = [ "9" ];
        previous_section = [ "Backspace" ];
        mark = [ "m" ];
        remove_mark = [ "M" ];
        remove_all_mark = [ "ctrl+delete" ];
        next_mark = [ ">" ];
        previous_mark = [ "<" ];
        set_view_mode = [
          "p"
          "P"
        ];
        alter_rows_mode = [ "C" ];
        line_number_mode = [ "G" ];
        search = [ "/" ];
        wrap_mode = [
          "w"
          "W"
        ];
        column_mode = [ "c" ];
        backsearch = [ "?" ];
        delimiter = [ "d" ];
        header = [ "H" ];
        skip_lines = [ "ctrl+s" ];
        tabwidth = [ "t" ];
        goto = [ "g" ];
        next_search = [ "n" ];
        next_backsearch = [ "N" ];
        next_doc = [ "]" ];
        previous_doc = [ "[" ];
        toggle_mouse = [
          "ctrl+f3"
          "ctrl+alt+r"
        ];
        multi_color = [ "." ];
        jump_target = [ "J" ];
      };
      Mode = {
        Psql = {
          Header = 2;
          AlternateRows = true;
          ColumnMode = true;
          LineNumMode = false;
          WrapMode = true;
          ColumnDelimiter = "|";
        };
        Mysql = {
          Header = 3;
          AlternateRows = true;
          ColumnMode = true;
          LineNumMode = false;
          WrapMode = true;
          ColumnDelimiter = "|";
        };
      };
    };
  };
  env.DELTA_PAGER = "ov --section-delimiter '^(commit|added:|removed:|renamed:|Δ)' --section-header --pattern '•'";
}
