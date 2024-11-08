{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-continuum";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "continuum.tmux";
}
