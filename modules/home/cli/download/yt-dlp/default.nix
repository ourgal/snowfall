{
  path = ./.;
  myPkgs = "yt";
  progs.yt-dlp.settings = {
    format = "bestvideo[ext=mp4][width<2000][height<=1200]+bestaudio[ext=m4a]/bestvideo[ext=webm][width<2000][height<=1200]+bestaudio[ext=webm]/bestvideo[width<2000][height<=1200]+bestaudio/best[width<2000][height<=1200]/best";
    concurrent-fragments = 5;
    trim-filenames = 20;
    embed-subs = true;
    downloader = "aria2c";
  };
}
