{
  writeShellApplication,
  lib,
  ripgrep,
  fzf,
  ...
}:
writeShellApplication rec {
  name = "live-grep";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [
    ripgrep
    fzf
  ];

  text = builtins.readFile ./live-grep.sh;
}
