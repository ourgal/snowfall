{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "aria2-session";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ ];

  text = builtins.readFile ./aria2-session.sh;
}
