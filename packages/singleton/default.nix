{
  writeShellApplication,
  lib,
  xdotool,
  ...
}:
writeShellApplication rec {
  name = "singleton";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ xdotool ];

  text = builtins.readFile ./singleton.sh;
}
