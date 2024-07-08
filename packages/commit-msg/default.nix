{
  writeShellApplication,
  lib,
  pkgs,
  ...
}:
writeShellApplication rec {
  name = "commit-msg";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = # bash
    ''
      MSG_FILE=$1
      ${pkgs.commitizen}/bin/cz check --allow-abort --commit-msg-file $MSG_FILE
    '';
}
