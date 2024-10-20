{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-colored-man";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Color-enabled man pages plugin for fish-shell";
    homepage = "https://github.com/decors/fish-colored-man";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
