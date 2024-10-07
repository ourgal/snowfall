{
  lib,
  fetchFromGitHub,
  pkgs,
  namespace,
}:
let
  pname = "mpv-M-x";
  source = lib.${namespace}.sources.${pname};
in
pkgs.${namespace}.mkMpvPlugin {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  scriptPath = "M-x.lua";
  extraScripts = [ "script-modules/extended-menu.lua" ];

  preInstall = ''
    substituteInPlace M-x.lua \
      --replace-fail '~~/script-modules/?.lua' "$out/share/mpv/scripts/extended-menu.lua"
  '';
}
