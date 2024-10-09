{ pkgs, namespace }:
let
  pluginName = "tmux-pane-focus";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "focus.tmux";
}
