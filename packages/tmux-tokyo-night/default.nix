{
  lib,
  tmuxPlugins,
  _sources',
}:

tmuxPlugins.mkTmuxPlugin rec {
  pluginName = "tmux-tokyo-night";
  rtpFilePath = "tmux-tokyo-night.tmux";

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
