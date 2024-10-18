{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-zoom";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Toggle zoom in / out individual windows (splits";
    homepage = "https://github.com/ourgal/vim-zoom";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
