{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-kanagawa";
  version = "unstable-2023-12-23";
  rtpFilePath = "kanagawa.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "Nybkox";
    repo = "tmux-kanagawa";
    rev = "d1dc78128778f1e958e3e2eface0f48456810e81";
    sha256 = "1hcg6faanlps79bs43almyah33vjagfli0wy2x7vm1kfiydgq40r";
  };
}
