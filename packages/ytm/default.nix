{
  writeShellApplication,
  lib,
  yt-dlp,
  ...
}:
writeShellApplication rec {
  name = "ytm";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ yt-dlp ];

  text = builtins.readFile ./ytm.sh;
}
