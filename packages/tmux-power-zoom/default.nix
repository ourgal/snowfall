{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-power-zoom";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "power-zoom.tmux";
}
