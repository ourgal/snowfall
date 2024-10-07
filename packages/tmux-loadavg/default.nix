{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "tmux-loadavg";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-${source.date}";
  rtpFilePath = "tmux-loadavg.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
