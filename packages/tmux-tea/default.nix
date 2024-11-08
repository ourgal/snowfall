{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-tea";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "tea.tmux";
}
