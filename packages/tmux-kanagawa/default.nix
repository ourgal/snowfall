{ pkgs, namespace }:
let
  pluginName = "tmux-kanagawa";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "kanagawa.tmux";
}
