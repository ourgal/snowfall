{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "tmux-transient-status";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-${source.date}";
  rtpFilePath = "main.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
