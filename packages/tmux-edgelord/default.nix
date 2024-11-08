{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-edgelord";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "setup.tmux";
}
