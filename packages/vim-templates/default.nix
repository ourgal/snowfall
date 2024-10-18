{
  lib,
  pkgs,
  namespace,
}:

let
  pname = "vim-templates";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Create files from templates";
    homepage = "https://github.com/tibabit/vim-templates";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
