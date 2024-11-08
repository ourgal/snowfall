{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-which-key";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "plugin.sh.tmux";
}
