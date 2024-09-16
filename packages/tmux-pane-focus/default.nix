{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-pane-focus";
  version = "unstable-2024-05-05";
  rtpFilePath = "focus.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "graemedavidson";
    repo = "tmux-pane-focus";
    rev = "94adfd620bee88b9262fe28df6b07a23e82f3a5c";
    hash = "sha256-Aur7OkJ8De6BDtSJHSfO1LLpbCfjWsxXi8jh5HNlUbo=";
  };
}
