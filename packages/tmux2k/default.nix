{ _sources, tmuxPlugins }:
let
  pluginName = "tmux2k";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "2k.tmux";
}
