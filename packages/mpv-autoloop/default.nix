{ pkgs, namespace }:
let
  pname = "mpv-autoloop";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.mpvScripts.buildLua {
  inherit (source) pname version src;

  scriptPath = "autoloop.lua";
}
