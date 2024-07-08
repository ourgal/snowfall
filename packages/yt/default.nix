{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "yt";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./yt.sh;
}
