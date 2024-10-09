{
  writeShellApplication,
  lib,
  namespace,
  pkgs,
}:
let
  name = "git-heatgrid";
  inherit (pkgs.${namespace}.sources.${name}) src;
in
writeShellApplication rec {
  inherit name;

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  checkPhase = "";

  runtimeInputs = [ ];

  text = builtins.readFile (src + /git-heatgrid);
}
