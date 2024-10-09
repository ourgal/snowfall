{ pkgs, namespace }:
let
  pluginName = "tmux-loadavg";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "tmux-loadavg.tmux";
}
