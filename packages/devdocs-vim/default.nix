{
  lib,
  pkgs,
  namespace,
}:

let
  pname = "devdocs-vim";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Lookup  API documentation from devdocs.io without leaving Vim";
    homepage = "https://github.com/girishji/devdocs.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
