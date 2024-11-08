{ _sources, mpvScripts }:
mpvScripts.buildLua {
  inherit (_sources.mpv-autoloop) pname version src;

  scriptPath = "autoloop.lua";
}
