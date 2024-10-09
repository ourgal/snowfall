{ pkgs, namespace }:
let
  pluginName = "tmux-edgelord";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "setup.tmux";
}
