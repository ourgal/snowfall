{ pkgs, namespace }:
let
  pluginName = "tmux-transient-status";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "main.tmux";
}
