{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Vim plugin for generating images of source code using https://github.com/Aloxaf/silicon";
    homepage = "https://github.com/segeljakt/vim-silicon";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
