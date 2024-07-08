{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "newsboat-open";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./newsboat-open.sh;
}
