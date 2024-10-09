{ pkgs, namespace }:
let
  pluginName = "tmux-which-key";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "plugin.sh.tmux";
}
