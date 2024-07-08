{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "anime";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./anime.sh;
}
