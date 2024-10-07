{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "tmux-continuum";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-${source.date}";
  rtpFilePath = "continuum.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
