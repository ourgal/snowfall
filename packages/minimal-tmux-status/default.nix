{ pkgs, namespace }:
let
  pluginName = "minimal-tmux-status";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "minimal.tmux";
}
