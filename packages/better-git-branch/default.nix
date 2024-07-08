{ writeShellApplication, lib, ... }:
writeShellApplication rec {
  name = "better-git-branch";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile ./better-git-branch.sh;
}
