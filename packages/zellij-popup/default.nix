{
  writeShellApplication,
  lib,
  zellij,
  ...
}:
writeShellApplication rec {
  name = "zellij-popup";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ zellij ];

  text = builtins.readFile ./zellij-popup.sh;
}
