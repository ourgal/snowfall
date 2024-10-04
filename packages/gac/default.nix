{
  writeShellApplication,
  lib,
  git,
}:
writeShellApplication rec {
  name = "gac";

  meta = {
    description = "One simple command to format and faster your git add and git commit actions.";
    homepage = "https://github.com/devpolo/gac";
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ git ];

  text = builtins.readFile ./gac.sh;
}
