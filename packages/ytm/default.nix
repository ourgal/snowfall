{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "ytm";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./ytm.sh;
}
