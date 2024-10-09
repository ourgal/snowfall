{ pkgs, namespace }:
let
  pluginName = "tmux-continuum";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "continuum.tmux";
}
