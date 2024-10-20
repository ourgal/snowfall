{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fc-fish";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Bash style fc for Fish";
    homepage = "https://github.com/lengyijun/fc-fish";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
