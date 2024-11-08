{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-pane-focus";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "focus.tmux";
}
