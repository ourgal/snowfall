{
  writeShellApplication,
  lib,
  gitmoji-cli,
  ...
}:
writeShellApplication rec {
  name = "git-prepare-commit-msg";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ gitmoji-cli ];

  text = # bash
    ''
      COMMIT_MSG_FILE="''${1:-""}"
      COMMIT_SOURCE="''${2:-""}"
      exec < /dev/tty
      gitmoji --hook $COMMIT_MSG_FILE $COMMIT_SOURCE'';
}
