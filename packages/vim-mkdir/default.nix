{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-mkdir";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Automatically create any non-existent directories before writing the buffer";
    homepage = "https://github.com/pbrisbin/vim-mkdir";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
