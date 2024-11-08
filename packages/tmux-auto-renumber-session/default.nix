{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-auto-renumber-session";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "tmux-auto-renumber-session.tmux";
}
