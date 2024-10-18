{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "easyjump-vim";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "The Vim motion you've always wanted";
    homepage = "https://github.com/girishji/easyjump.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
