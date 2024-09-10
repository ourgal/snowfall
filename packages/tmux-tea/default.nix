{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-tea";
  version = "unstable-2024-09-10";
  rtpFilePath = "tea.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "ourgal";
    repo = "tmux-tea";
    rev = "345af747c36e94344cbb360310f1d746f1517b6a";
    hash = "sha256-CgPn+VZmaMm8lxJlgzQRLdhwHM/XA+KSIr/qwQdf5bs=";
  };
}
