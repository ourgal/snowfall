{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-loadavg";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "tmux-loadavg.tmux";
}
