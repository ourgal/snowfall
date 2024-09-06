{
  writeShellApplication,
  lib,
  pkgs,
  namespace,
  ...
}:
writeShellApplication rec {
  name = "git-pre-commit";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = # bash
    ''
      root=$(${pkgs.git}/bin/git rev-parse --show-toplevel)
      _files=$(${pkgs.git}/bin/git ls-files)
      files="''${_files//$'\n'/ }"
      ${pkgs.gitleaks}/bin/gitleaks protect -v --staged
      ${pkgs.treefmt2}/bin/treefmt --config-file="~/.config/treefmt/config.toml" -C "$root"
      ${pkgs.keep-sorted}/bin/keep-sorted --mode fix $files
      ${
        pkgs.${namespace}.whitespace-format
      }/bin/whitespace-format --remove-trailing-whitespace --remove-trailing-empty-lines --exclude "(.gpg|.png|.jpg|.jpeg|.webp|.gif|.dat|.age|.mp3|.mp4|.mkv|.ttf|.ico|.xcf)$" $files
    '';
}
