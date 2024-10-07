{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "tmux-tome";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-${source.date}";
  rtpFilePath = "tome.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
