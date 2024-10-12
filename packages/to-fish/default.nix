{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "to-fish";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Bookmarks for Fish Shell";
    homepage = "https://github.com/joehillen/to-fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "to-fish";
    platforms = platforms.all;
  };
}
