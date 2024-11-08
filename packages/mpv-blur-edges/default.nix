{ mpvScripts, _sources }:
mpvScripts.buildLua {
  inherit (_sources.mpv-blur-edges) pname version src;

  scriptPath = "scripts/blur-edges.lua";
}
