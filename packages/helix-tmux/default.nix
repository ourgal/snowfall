{
  writeShellApplication,
  lib,
  broot,
  gnumake,
  ...
}:
writeShellApplication rec {
  name = "helix-tmux";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    broot
    gnumake
  ];

  text = builtins.readFile ./helix-tmux.sh;
}
