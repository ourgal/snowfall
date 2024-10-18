{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-workspace";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Automated Vim session management with file auto-save and persistent undo history";
    homepage = "https://github.com/thaerkh/vim-workspace";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
