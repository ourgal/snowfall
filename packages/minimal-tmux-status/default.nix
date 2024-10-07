{
  pkgs,
  lib,
  namespace,
}:
let
  pluginName = "minimal-tmux-status";
  source = lib.${namespace}.sources.${pluginName};
in
pkgs.tmuxPlugins.mkTmuxPlugin {
  inherit pluginName;
  version = "unstable-2024-02-18";
  rtpFilePath = "minimal.tmux";
  src = pkgs.fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };
}
