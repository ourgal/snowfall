{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "visual-split-vim";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Vim plugin to control splits with visual selections or text objects";
    homepage = "https://github.com/wellle/visual-split.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
