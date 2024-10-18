{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vim-github-link";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Generate github link from selected lines in vim";
    homepage = "https://github.com/knsh14/vim-github-link";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
