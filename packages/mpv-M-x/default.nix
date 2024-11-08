{ _sources, mpvScripts }:
mpvScripts.buildLua {
  inherit (_sources.mpv-M-x) pname version src;

  scriptPath = "M-x.lua";
  extraScripts = [ "script-modules/extended-menu.lua" ];

  preInstall = ''
    substituteInPlace M-x.lua \
      --replace-fail '~~/script-modules/?.lua' "$out/share/mpv/scripts/extended-menu.lua"
  '';
}
