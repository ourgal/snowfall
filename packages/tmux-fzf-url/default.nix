{ tmuxPlugins, _sources }:
let
  pluginName = "tmux-fzf-url";
in
tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (_sources.${pluginName}) version src;
  rtpFilePath = "fzf-url.tmux";
}
