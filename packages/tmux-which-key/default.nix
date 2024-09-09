{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-which-key";
  version = "unstable-2024-09-09";
  rtpFilePath = "plugin.sh.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "ourgal";
    repo = "tmux-which-key";
    rev = "b7283f4ccece66dd4a49fd6badd55b43262c6ae6";
    hash = "sha256-zJlQ+3945xrfI5BpywpB5J79m5j2y3vtLUHsZgUaCJ0=";
  };
}
