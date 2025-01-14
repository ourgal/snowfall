args:
args.module (
  args
  // {
    path = ./.;
    progs.mpv = {
      bindings = {
        p = "set speed 3.0";
      };
      config = {
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
        keep-open = "always";
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
    };
    value.catppuccin.mpv.enable = false;
  }
)
