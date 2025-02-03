{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-buoyshell";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "buoyshell.tmux";
}
