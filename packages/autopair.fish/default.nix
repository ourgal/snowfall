{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources."autopair.fish") pname version src;

  meta = with lib; {
    description = "Auto-complete matching pairs in the Fish command line";
    homepage = "https://github.com/ourgal/autopair.fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "autopair-fish";
    platforms = platforms.all;
  };
}
