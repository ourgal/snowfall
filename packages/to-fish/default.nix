{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.to-fish) pname version src;

  meta = with lib; {
    description = "Bookmarks for Fish Shell";
    homepage = "https://github.com/joehillen/to-fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "to-fish";
    platforms = platforms.all;
  };
}
