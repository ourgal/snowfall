{
  writeShellApplication,
  lib,
  i3lock-color,
  ...
}:
writeShellApplication rec {
  name = "i3lock-color";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ i3lock-color ];

  text = builtins.readFile ./i3lock-color.sh;
}
