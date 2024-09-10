{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-power-zoom";
  version = "unstable-2024-08-25";
  rtpFilePath = "power-zoom.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "jaclu";
    repo = "tmux-power-zoom";
    rev = "2297919bce52d45ba5bf0483942553b35909bca0";
    hash = "sha256-ZWXwMDJW5MXcKw5aV70TXybPD5tkEJqomO4TX2Z0D6o=";
  };
}
