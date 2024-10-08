{
  writeShellApplication,
  lib,
  pkgs,
  namespace,
  git,
  gitleaks,
  keep-sorted,
  ...
}:
writeShellApplication rec {
  name = "git-pre-commit";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [
    git
    gitleaks
    keep-sorted
    pkgs.${namespace}.whitespace-format
  ];

  text = # bash
    ''
      _files=$(git diff --name-only --cached --diff-filter=ACMRT)
      files="''${_files//$'\n'/ }"
      gitleaks protect -v --staged
      if test -n "$files"; then
        keep-sorted --mode fix $files
        whitespace-format --remove-trailing-whitespace --remove-trailing-empty-lines --exclude "(.gpg|.png|.jpg|.jpeg|.webp|.gif|.dat|.age|.mp3|.mp4|.mkv|.ttf|.ico|.xcf)$" $files
      fi
      if test -f .git/hooks/pre-commit; then
         .git/hooks/pre-commit "$@"
      fi
    '';
}
