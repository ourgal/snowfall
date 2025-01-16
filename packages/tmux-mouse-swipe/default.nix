{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-mouse-swipe";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "mouse-swipe.tmux";
}
