{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-kanagawa";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "kanagawa.tmux";
}
