{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "chezmoi-vim";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Highlight dotfiles you manage with chezmoi";
    homepage = "https://github.com/alker0/chezmoi.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
