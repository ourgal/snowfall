{ tmuxPlugins, _sources' }:
tmuxPlugins.mkTmuxPlugin rec {
  pluginName = pname;
  inherit (_sources' ./.) pname version src;
  rtpFilePath = "tmux-auto-renumber-session.tmux";
}
