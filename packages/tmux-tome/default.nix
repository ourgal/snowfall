{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-tome";
  version = "unstable-2024-05-10";
  rtpFilePath = "tome.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "laktak";
    repo = "tome";
    rev = "a9afdbe6490ecd5d2d66bc024b7d53a3b616f137";
    hash = "sha256-ShBTFwOBRyybpLNmtx5/juTnssPjiXqBzH6sYYsVvnE=";
  };
}
