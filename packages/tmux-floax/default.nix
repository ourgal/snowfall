{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-floax";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "floax.tmux";
}
