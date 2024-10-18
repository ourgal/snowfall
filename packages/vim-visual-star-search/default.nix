{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-visual-star-search";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Start a * or # search from a visual block";
    homepage = "https://github.com/ourgal/vim-visual-star-search";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
