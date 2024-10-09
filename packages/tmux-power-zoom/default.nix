{ pkgs, namespace }:
let
  pluginName = "tmux-power-zoom";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "power-zoom.tmux";
}
