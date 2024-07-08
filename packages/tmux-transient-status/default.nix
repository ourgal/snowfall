{ pkgs, ... }:
pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmux-transient-status";
  version = "unstable-2023-12-26";
  rtpFilePath = "main.tmux";
  src = pkgs.fetchFromGitHub {
    owner = "TheSast";
    repo = "tmux-transient-status";
    rev = "c3fcd5180999a7afc075d2dd37d37d1b1b82f7e8";
    sha256 = "04fwmzf0zn4550kw11mz3irxrz85zs9kvrhc5xak212m2pr2gqkw";
  };
}
