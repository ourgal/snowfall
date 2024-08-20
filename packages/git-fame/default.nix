{
  writeShellApplication,
  lib,
  pkgs,
  ...
}:
writeShellApplication rec {
  name = "git-fame";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = ''
    ${pkgs.git-fame}/bin/git-fame --branch=$(${pkgs.git}/bin/git rev-parse --abbrev-ref HEAD) $@
  '';
}
