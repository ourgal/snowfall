{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "vimsuggest";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Auto-completion for Vim's command-line";
    homepage = "https://github.com/girishji/vimsuggest";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
