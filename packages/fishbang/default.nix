{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fishbang";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Bash bang commands for fish";
    homepage = "https://github.com/brewingweasel/fishbang";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fishbang";
    platforms = platforms.all;
  };
}
