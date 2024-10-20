{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-f";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Quickly get to a previously mentioned file in fish shell -- z for files";
    homepage = "https://github.com/sudormrfbin/f";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
