{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "tmux-popup";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./tmux-popup.sh;
}
