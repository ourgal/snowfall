{
  pog,
  yt-dlp,
  mpv,
  ...
}:
pog.pog {
  name = "yt";
  version = "0.1.0";
  description = "A script for Youtube";

  arguments = [ { name = "url"; } ];

  flags = [
    {
      name = "audio";
      description = "download mp3 audio";
      bool = true;
    }
    {
      name = "audio_dir";
      short = "";
      argument = "dir";
      description = "dir for audio";
      default = "$HOME/Music/youtube_dl/";
    }
  ];

  runtimeInputs = [
    yt-dlp
    mpv
  ];

  script =
    helpers: with helpers; ''
      if ${flag "audio"}; then
        mkdir -p "$audio_dir" > /dev/null 2>&1
        yt-dlp --trim-filenames 50 --no-write-subs --no-embed-subs --no-write-auto-subs -P "$audio_dir" -f 'ba' -x --audio-format mp3 "$1"
      else
        filename=$(yt-dlp --print filename --no-simulate -P ~/.cache/yt-dlp "$1")
        mpv --speed=3 "$filename"
        rm "$filename"
      fi
    '';
}
