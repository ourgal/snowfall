{ _sources, tmuxPlugins }:
let
  pluginName = "minimal-tmux-status";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "minimal.tmux";
}
