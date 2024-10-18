args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        cfgHome
        lib
        pkgs
        disabled
        enabled
        switch
        ;
      cfg = cfgHome config.${namespace} ./.;
      fileTypes = [
        "video/mp4"
        "video/x-matroska"
      ];
      defaults = lib.${namespace}.defaultTypes "mpv.desktop" fileTypes;
      base_config = {
        # profile = "gpu-hq";
        # icc-profile = "auto";
        # vf-append = "format=gamma=gamma2.2";
        blend-subtitles = "video";
        # video-sync = "display-resample";
        # interpolation = true;
        # tscale = "oversample";
        af = "scaletempo2";
        save-position-on-quit = true;
        pause = "no";
        fullscreen = "yes";
        force-seekable = "yes";
        keep-open = "no";
        sub-auto = "fuzzy";
        alang = "ja,jp,jpn,en,eng";
        slang = "en,eng,chs,sc,zh,chi,zho,zh-Hant,zh-CN,zh-Hans";
        volume = 100;
        audio-file-auto = "fuzzy";
        volume-max = 200;
        audio-pitch-correction = "yes";
        hwdec = "auto";
        audio-device = "alsa";
        input-ipc-server = "/tmp/mpvsocket";
      };
      yt_subs_config = {
        osd-bar-align-y = 0.92;
        sub-ass = "yes";
        sub-ass-line-spacing = 5;
        sub-scale = 1;
        sub-color = "#ffffffff";
        sub-shadow-color = "#ff000000";
        sub-back-color = "#aa000000";
        sub-border-color = "#ff0a0a0a";
        sub-border-size = 0.75;
        sub-shadow-offset = 2.5;
        sub-font-size = 64;
        sub-bold = "yes";
        sub-italic = "no";
        sub-margin-y = 30;
        sub-margin-x = 60;
        sub-ass-force-style = "PlayResX=1280,PlayResY=720,Name=Default,Fontname=Liberation Sans Narrow,Fontsize=32,PrimaryColour=&H00ffffff,BackColour=&H00000000,OutlineColour=&H00000000,Bold=1,Italic=0,Alignment=2,BorderStyle=3,Outline=0.3,Shadow=0,MarginL=60,MarginR=60,MarginV=30";
      };
    in
    {
      path = ./.;
      progs.mpv = {
        catppuccin = disabled;
        config = if cfg.yt-subs.enable then base_config // yt_subs_config else base_config;
        scripts =
          with pkgs.mpvScripts;
          with pkgs.${namespace};
          [
            mpris
            quack
            sponsorblock
            thumbfast
            uosc
            mpv-autoloop
            mpv-smartcopypaste_ii
            mpv-smartskip
            mpv-M-x
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
      value = {
        xdg.mimeApps = enabled // {
          associations.added = defaults;
          defaultApplications = defaults;
        };
      };
      extraOpts = {
        yt-subs = switch;
      };
    }
  )
)
