{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "A Vim plugin which saves files to disk automatically";
    homepage = "https://github.com/ourgal/vim-auto-save";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
