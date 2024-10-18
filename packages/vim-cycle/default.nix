{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-cycle";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "A vim plugin to toggle words between pairs or lists of related words";
    homepage = "https://github.com/zef/vim-cycle";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
