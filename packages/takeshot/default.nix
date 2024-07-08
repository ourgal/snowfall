{
  writeShellApplication,
  lib,
  maim,
  imagemagick,
  xdotool,
  xclip,
  libnotify,
  ...
}:
writeShellApplication rec {
  name = "takeshot";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    maim
    imagemagick
    xdotool
    xclip
    libnotify
  ];

  text = builtins.readFile ./takeshot.sh;
}
