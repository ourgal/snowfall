{ _sources', mpvScripts }:
mpvScripts.buildLua {
  inherit (_sources' ./.) pname version src;

  scriptPath = "autoloop.lua";
}
