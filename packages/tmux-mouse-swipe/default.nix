{ tmuxPlugins, _sources' }:
tmuxPlugins.mkTmuxPlugin rec {
  pluginName = pname;
  inherit (_sources' ./.) pname version src;
  rtpFilePath = "mouse-swipe.tmux";
}
