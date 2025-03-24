{
  lib,
  _sources',
  fishPlugins,
}:
fishPlugins.buildFishPlugin rec {
  inherit (_sources' ./.) pname src version;

  meta = with lib; {
    description = "Rocket: A next-generation cd command with your interactive filter";
    homepage = "https://github.com/babarot/enhancd";
    changelog = "https://github.com/babarot/enhancd/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
