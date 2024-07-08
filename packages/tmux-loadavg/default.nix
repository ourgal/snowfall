{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-loadavg";
  version = "unstable-2018-05-30";
  rtpFilePath = "tmux-loadavg.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "jamesoff";
    repo = "tmux-loadavg";
    rev = "91319eff74ee677efb77c882dcc8e3b8780dc3a2";
    hash = "sha256-JW/O/bVryDILlFCnWYRC+B7nrCIsGYEJDozzu0odX+U=";
  };
}
