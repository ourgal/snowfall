{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "zellij-popup";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./zellij-popup.sh;
}
