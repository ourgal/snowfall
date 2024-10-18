{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-floaterm";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  patches = [ ./broot.patch ];

  meta = with lib; {
    description = "Computer: Terminal manager for (neo)vim";
    homepage = "https://github.com/voldikss/vim-floaterm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
