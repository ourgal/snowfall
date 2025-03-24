{
  lib,
  _sources',
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Bookmarks for Fish Shell";
    homepage = "https://github.com/joehillen/to-fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
