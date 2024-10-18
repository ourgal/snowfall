{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "pangu-vim";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "盘古之白』中文排版自动规范化的 Vim 插件";
    homepage = "https://github.com/hotoo/pangu.vim";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
