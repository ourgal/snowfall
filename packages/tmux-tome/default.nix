{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-tome";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "tome.tmux";
}
