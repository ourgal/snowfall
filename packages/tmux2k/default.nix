{ pkgs, namespace }:
let
  pluginName = "tmux2k";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "2k.tmux";
}
