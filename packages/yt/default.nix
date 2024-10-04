{
  writeShellApplication,
  lib,
  yt-dlp,
  mpv,
  ...
}:
writeShellApplication rec {
  name = "yt";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    yt-dlp
    mpv
  ];

  text = builtins.readFile ./yt.sh;
}
