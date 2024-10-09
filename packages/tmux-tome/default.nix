{ pkgs, namespace }:
let
  pluginName = "tmux-tome";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "tome.tmux";
}
