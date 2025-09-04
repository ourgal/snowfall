args:
args.module (
  args
  // (
    let
      inherit (args) config;
      format = {
        HD = "bestvideo[height<=720]+bestaudio/best[height<=720]";
        FHD = "bestvideo[ext=mp4][width<2000][height<=1200]+bestaudio[ext=m4a]/bestvideo[ext=webm][width<2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<2000][height<=1200]+bestaudio/best[width<2000][height<=1200]/best";
      };
    in
    {
      myX86Pkgs = "yt";
      progs.yt-dlp.settings = {
        format = format.HD;
        concurrent-fragments = 5;
        trim-filenames = 20;
        embed-subs = true;
        downloader = "aria2c";
        no-mtime = true;
        cookies-from-browser = "firefox";
      };
      tmpfiles = [ "d ${config.home.homeDirectory}/Downloads/youtube - - - - -" ];
    }
  )
)
