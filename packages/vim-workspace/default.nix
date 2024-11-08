{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.vim-workspace) pname version src;

  meta = with lib; {
    description = "Automated Vim session management with file auto-save and persistent undo history";
    homepage = "https://github.com/thaerkh/vim-workspace";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
