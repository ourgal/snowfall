{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fifc) pname version src;

  meta = with lib; {
    description = "Configurable fzf completions for fish shell";
    homepage = "https://github.com/gazorby/fifc";
    changelog = "https://github.com/gazorby/fifc/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
