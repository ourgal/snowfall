{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "minimal-tmux-status";
  version = "unstable-2024-02-18";
  rtpFilePath = "minimal.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "niksingh710";
    repo = "minimal-tmux-status";
    rev = "5183698f30c521fdf890d287e3ba2f81ea4e0d1c";
    sha256 = "17a3dr4lb1fi2rnq4jvc07qz44qrirxl22iw9v5wh0imiiblrf86";
  };
}
