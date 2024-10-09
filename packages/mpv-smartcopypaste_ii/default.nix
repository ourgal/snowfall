{ pkgs, namespace }:
let
  pname = "mpv-smartcopypaste_ii";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.${namespace}.mkMpvPlugin {
  inherit (source) pname version src;

  scriptPath = "scripts/SmartCopyPaste_II.lua";
}
