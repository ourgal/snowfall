{ pkgs, namespace }:
let
  pname = "mpv-smartskip";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.mpvScripts.buildLua {
  inherit (source) pname version src;

  scriptPath = "scripts/SmartSkip.lua";
}
