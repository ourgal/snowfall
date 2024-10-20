{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-gitnow";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Speed up your Git workflow. :tropical_fish";
    homepage = "https://github.com/joseluisq/gitnow";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gitnow";
    platforms = platforms.all;
  };
}
