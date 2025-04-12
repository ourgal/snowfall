{
  lib,
  tmuxPlugins,
  _sources',
}:

tmuxPlugins.mkTmuxPlugin rec {
  inherit (_sources' ./.) pname version src;
  pluginName = pname;
  rtpFilePath = "ssh-split.tmux";

  meta = {
    description = "TMUX plugin to split the current pane while retaining SSH connections";
    homepage = "https://github.com/pschmitt/tmux-ssh-split";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
