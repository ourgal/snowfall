{
  writeShellApplication,
  lib,
  git,
}:
writeShellApplication rec {
  name = "gace";

  meta = {
    description = "One simple command to format and faster your git add and git commit actions.";
    homepage = "https://github.com/devpolo/gac";
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ git ];

  text = builtins.readFile ./gace.sh;
}