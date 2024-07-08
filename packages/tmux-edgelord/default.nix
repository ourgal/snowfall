{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "edgelord";
  version = "unstable-2024-07-08";
  rtpFilePath = "setup.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "ourgal";
    repo = "tmux-edgelord";
    rev = "a390528534bf8e0f050daa1776db555eba4fadd9";
    sha256 = "03pdqb2qj0lp0k93flv7m2wg4l0pki92a0hlvhrxb4awljnydsld";
  };
}
