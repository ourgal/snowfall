{ pkgs, namespace }:
let
  pluginName = "tmux-auto-renumber-session";
  source = pkgs.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  inherit (source) version src;
  rtpFilePath = "tmux-auto-renumber-session.tmux";
}
