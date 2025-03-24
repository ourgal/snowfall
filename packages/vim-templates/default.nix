{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Create files from templates";
    homepage = "https://github.com/tibabit/vim-templates";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
