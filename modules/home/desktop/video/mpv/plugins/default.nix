args:
args.module (
  args
  // (
    let
      inherit (args) namespace lib pkgs;
      inherit (lib.${namespace}) with';
    in
    {
      path = ./.;
      progs.mpv = {
        scripts =
          with' pkgs.mpvScripts [
            "mpris"
            "quack"
            "sponsorblock"
            "thumbfast"
            "uosc"
          ]
          ++ with' pkgs.${namespace} [
            "mpv-autoloop"
            "mpv-smartcopypaste_ii"
            "mpv-smartskip"
            "mpv-M-x"
            # "mpv-btfs-stream"
          ];
        scriptOpts = {
          uosc = {
            autohide = "yes";
          };
          SmartSkip = {
            silence_audio_level = "-60";
            silence_duration = "0.85";
            silence_skip_to_end = "cancel";
            min_skip_duration = 0;
            max_skip_duration = 0;
            autoload_playlist = "no";
            ignore_silence_duration = 5;
          };
          autoloop = {
            autoloop_duration = 360;
          };
          M-x = {
            # strip cmd name
            strip_cmd_at = 65;
            # available values: priority, command_name
            sort_commands_by = "priority";
            #- options for extended menu ------------------------------------------------
            toggle_menu_binding = "t";
            lines_to_show = 17;
            pause_on_open = "yes";
            resume_on_exit = "only-if-was-paused";

            #- styles
            font_size = 21;
            # cursor 'width', useful to change if you have hidpi monitor
            cursor_x_border = 0.3;
            line_bottom_margin = 1;
            menu_x_padding = 5;
            menu_y_padding = 2;

            # heading text of a search bar
            search_heading = "M-x";
            # will determine in which fields to look for your search query. For instance if
            # you don't want to search in comments to commands then just omit it from initial
            # table.
            filter_by_fields = [
              "cmd"
              "key"
              "comment"
            ];
            column_layout = "no";
          };
        };
      };
    }
  )
)
