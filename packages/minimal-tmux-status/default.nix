{ _sources', tmuxPlugins }:
tmuxPlugins.mkTmuxPlugin rec {
  pluginName = pname;
  inherit (_sources' ./.) pname version src;
  rtpFilePath = "minimal.tmux";
}
