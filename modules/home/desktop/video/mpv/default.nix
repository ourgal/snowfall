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
      inherit (lib.${namespace}) with';
      cfg = cfgHome config.${namespace} ./.;
      fileTypes = [
        "application/ogg"
        "application/x-ogg"
        "application/mxf"
        "application/sdp"
        "application/smil"
        "application/x-smil"
        "application/streamingmedia"
        "application/x-streamingmedia"
        "application/vnd.rn-realmedia"
        "application/vnd.rn-realmedia-vbr"
        "audio/aac"
        "audio/x-aac"
        "audio/vnd.dolby.heaac.1"
        "audio/vnd.dolby.heaac.2"
        "audio/aiff"
        "audio/x-aiff"
        "audio/m4a"
        "audio/x-m4a"
        "application/x-extension-m4a"
        "audio/mp1"
        "audio/x-mp1"
        "audio/mp2"
        "audio/x-mp2"
        "audio/mp3"
        "audio/x-mp3"
        "audio/mpeg"
        "audio/mpeg2"
        "audio/mpeg3"
        "audio/mpegurl"
        "audio/x-mpegurl"
        "audio/mpg"
        "audio/x-mpg"
        "audio/rn-mpeg"
        "audio/musepack"
        "audio/x-musepack"
        "audio/ogg"
        "audio/scpls"
        "audio/x-scpls"
        "audio/vnd.rn-realaudio"
        "audio/wav"
        "audio/x-pn-wav"
        "audio/x-pn-windows-pcm"
        "audio/x-realaudio"
        "audio/x-pn-realaudio"
        "audio/x-ms-wma"
        "audio/x-pls"
        "audio/x-wav"
        "video/mpeg"
        "video/x-mpeg2"
        "video/x-mpeg3"
        "video/mp4v-es"
        "video/x-m4v"
        "video/mp4"
        "application/x-extension-mp4"
        "video/divx"
        "video/vnd.divx"
        "video/msvideo"
        "video/x-msvideo"
        "video/ogg"
        "video/quicktime"
        "video/vnd.rn-realvideo"
        "video/x-ms-afs"
        "video/x-ms-asf"
        "audio/x-ms-asf"
        "application/vnd.ms-asf"
        "video/x-ms-wmv"
        "video/x-ms-wmx"
        "video/x-ms-wvxvideo"
        "video/x-avi"
        "video/avi"
        "video/x-flic"
        "video/fli"
        "video/x-flc"
        "video/flv"
        "video/x-flv"
        "video/x-theora"
        "video/x-theora+ogg"
        "video/x-matroska"
        "video/mkv"
        "audio/x-matroska"
        "application/x-matroska"
        "video/webm"
        "audio/webm"
        "audio/vorbis"
        "audio/x-vorbis"
        "audio/x-vorbis+ogg"
        "video/x-ogm"
        "video/x-ogm+ogg"
        "application/x-ogm"
        "application/x-ogm-audio"
        "application/x-ogm-video"
        "application/x-shorten"
        "audio/x-shorten"
        "audio/x-ape"
        "audio/x-wavpack"
        "audio/x-tta"
        "audio/AMR"
        "audio/ac3"
        "audio/eac3"
        "audio/amr-wb"
        "video/mp2t"
        "audio/flac"
        "audio/mp4"
        "application/x-mpegurl"
        "video/vnd.mpegurl"
        "application/vnd.apple.mpegurl"
        "audio/x-pn-au"
        "video/3gp"
        "video/3gpp"
        "video/3gpp2"
        "audio/3gpp"
        "audio/3gpp2"
        "video/dv"
        "audio/dv"
        "audio/opus"
        "audio/vnd.dts"
        "audio/vnd.dts.hd"
        "audio/x-adpcm"
        "application/x-cue"
        "audio/m3u"
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
            "mpv-btfs-stream"
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
