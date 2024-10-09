{ pkgs, namespace }:
let
  pluginName = "tmux-tea";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "tea.tmux";
}
