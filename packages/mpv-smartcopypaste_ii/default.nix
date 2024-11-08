{ _sources, mpvScripts }:
mpvScripts.buildLua {
  inherit (_sources.mpv-smartcopypaste_ii) pname version src;

  scriptPath = "scripts/SmartCopyPaste_II.lua";
}
