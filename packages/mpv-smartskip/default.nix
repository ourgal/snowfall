{ mpvScripts, _sources }:
mpvScripts.buildLua {
  inherit (_sources.mpv-smartskip) pname version src;

  scriptPath = "scripts/SmartSkip.lua";
}
