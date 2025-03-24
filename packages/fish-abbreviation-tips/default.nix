{
  lib,
  _sources',
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Help you remembering your abbreviations";
    homepage = "https://github.com/gazorby/fish-abbreviation-tips";
    changelog = "https://github.com/gazorby/fish-abbreviation-tips/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fish-abbreviation-tips";
    platforms = platforms.all;
  };
}
