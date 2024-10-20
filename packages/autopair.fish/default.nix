{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "autopair.fish";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Auto-complete matching pairs in the Fish command line";
    homepage = "https://github.com/ourgal/autopair.fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "autopair-fish";
    platforms = platforms.all;
  };
}
