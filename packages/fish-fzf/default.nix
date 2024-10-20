{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-fzf";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Ef-🐟-ient fish keybindings for fzf";
    homepage = "https://github.com/jethrokuan/fzf";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fzf";
    platforms = platforms.all;
  };
}
