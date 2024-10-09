{ pkgs, namespace }:
let
  pname = "mpv-M-x";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.${namespace}.mkMpvPlugin {
  inherit (source) pname version src;

  scriptPath = "M-x.lua";
  extraScripts = [ "script-modules/extended-menu.lua" ];

  preInstall = ''
    substituteInPlace M-x.lua \
      --replace-fail '~~/script-modules/?.lua' "$out/share/mpv/scripts/extended-menu.lua"
  '';
}
