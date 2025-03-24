{ mpvScripts, _sources' }:
mpvScripts.buildLua {
  inherit (_sources' ./.) pname version src;

  scriptPath = "scripts/SmartSkip.lua";
}
