{
  writeShellApplication,
  lib,
  feh,
  yt-dlp,
  mpv,
  firefox,
  qutebrowser,
  ...
}:
writeShellApplication rec {
  name = "newsboat-open";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    feh
    yt-dlp
    mpv
    firefox
    qutebrowser
  ];

  text = builtins.readFile ./newsboat-open.sh;
}
