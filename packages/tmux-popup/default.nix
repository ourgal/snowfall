{
  writeShellApplication,
  lib,
  tmux,
}:
writeShellApplication rec {
  name = "tmux-popup";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ tmux ];

  text = builtins.readFile ./tmux-popup.sh;
}
