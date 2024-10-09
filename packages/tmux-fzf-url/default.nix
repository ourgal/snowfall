{ pkgs, namespace }:
let
  pluginName = "tmux-fzf-url";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "fzf-url.tmux";
}
