{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-toop";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Add custom behaviour to your text objects";
    homepage = "https://github.com/jeanCarloMachado/vim-toop";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
