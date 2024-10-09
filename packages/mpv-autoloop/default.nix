{ pkgs, namespace }:
let
  pname = "mpv-autoloop";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.${namespace}.mkMpvPlugin {
  inherit (source) pname version src;

  scriptPath = "autoloop.lua";
}
