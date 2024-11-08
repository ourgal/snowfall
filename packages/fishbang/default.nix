{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fishbang) pname version src;

  meta = with lib; {
    description = "Bash bang commands for fish";
    homepage = "https://github.com/brewingweasel/fishbang";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fishbang";
    platforms = platforms.all;
  };
}
