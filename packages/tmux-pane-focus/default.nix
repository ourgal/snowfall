{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "tmux-pane-focus";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-${source.date}";
  rtpFilePath = "focus.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
