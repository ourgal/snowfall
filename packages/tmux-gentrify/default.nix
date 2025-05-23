{
  lib,
  tmuxPlugins,
  _sources',
}:

tmuxPlugins.mkTmuxPlugin rec {
  inherit (_sources' ./.) pname version src;
  pluginName = pname;
  rtpFilePath = "plugin.tmux";

  meta = {
    description = "Move your tmux panes to better neighborhoods";
    homepage = "https://github.com/kristopolous/tmux-gentrify";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
