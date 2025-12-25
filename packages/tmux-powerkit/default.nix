{
  lib,
  tmuxPlugins,
  _sources',
}:

tmuxPlugins.mkTmuxPlugin rec {
  pluginName = "tmux-powerkit";
  rtpFilePath = "tmux-powerkit.tmux";

  inherit (_sources' ./.) pname version src;

  meta = {
    description = "";
    homepage = "https://github.com/fabioluciano/tmux-tokyo-night";
    changelog = "https://github.com/fabioluciano/tmux-tokyo-night/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
