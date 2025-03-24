{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  patches = [ ./broot.patch ];

  meta = with lib; {
    description = "Computer: Terminal manager for (neo)vim";
    homepage = "https://github.com/voldikss/vim-floaterm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
