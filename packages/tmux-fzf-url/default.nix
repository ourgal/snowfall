{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-fzf-url";
  version = "unstable-2024-04-14";
  rtpFilePath = "fzf-url.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "wfxr";
    repo = "tmux-fzf-url";
    rev = "28ed7ce3c73a328d8463d4f4aaa6ccb851e520fa";
    hash = "sha256-tl0SjG/CeolrN7OIHj6MgkB9lFmFgEuJevsSuwVs+78=";
  };
}
