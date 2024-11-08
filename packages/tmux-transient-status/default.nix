{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-transient-status";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "main.tmux";
}
