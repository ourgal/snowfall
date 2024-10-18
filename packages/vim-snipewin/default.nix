{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-snipewin";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Manipulate windows most quickly like sniper";
    homepage = "https://github.com/4513ECHO/vim-snipewin";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
