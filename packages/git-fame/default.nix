{
  writeShellApplication,
  lib,
  git-fame,
  git,
  ...
}:
writeShellApplication rec {
  name = "git-fame";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    git-fame
    git
  ];

  text = ''
    git-fame --branch="$(git rev-parse --abbrev-ref HEAD)" "$@"
  '';
}
