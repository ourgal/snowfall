{ _sources', mpvScripts }:
mpvScripts.buildLua {
  inherit (_sources' ./.) pname version src;

  scriptPath = "scripts/SmartCopyPaste_II.lua";
}
