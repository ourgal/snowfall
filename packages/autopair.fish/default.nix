{
  lib,
  _sources',
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Auto-complete matching pairs in the Fish command line";
    homepage = "https://github.com/ourgal/autopair.fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
