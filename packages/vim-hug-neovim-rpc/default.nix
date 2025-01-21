{
  lib,
  vimUtils,
  _sources,
}:

vimUtils.buildVimPlugin {
  inherit (_sources.vim-hug-neovim-rpc) pname version src;

  meta = {
    description = "EXPERIMENTAL";
    homepage = "https://github.com/roxma/vim-hug-neovim-rpc";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
