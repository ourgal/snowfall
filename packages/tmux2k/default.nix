{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux2k";
  version = "unstable-2024-02-05";
  rtpFilePath = "2k.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "2KAbhishek";
    repo = "tmux2k";
    rev = "70ea2d26265d469c391cbf45e5e65237ccb1855e";
    sha256 = "04jcsx9sjfc91b5kmr8nhixp6yiybx77m8smf9c6a4fl2m5dsak5";
  };
}
