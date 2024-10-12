{ pkgs, namespace }:
let
  pname = "mpv-blur-edges";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.mpvScripts.buildLua {
  inherit (source) pname version src;

  scriptPath = "scripts/blur-edges.lua";
}
