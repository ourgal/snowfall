{
  writeShellApplication,
  lib,
  fzf,
  sesh,
  ...
}:
writeShellApplication rec {
  name = "tmux-sesh";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    fzf
    sesh
  ];

  text = builtins.readFile ./tmux-sesh.sh;
}
