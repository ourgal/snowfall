{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "continuum";
  version = "unstable-2024-07-08";
  rtpFilePath = "continuum.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "ourgal";
    repo = "tmux-continuum";
    rev = "c7ae4f4f4a1c5b7a00718f71742eb3d3ebd9b82a";
    sha256 = "1vx53zmf50gjigdmxc6b1kv6vr02aq2jsf404r3gr71ychljz932";
  };
}
