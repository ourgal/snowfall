{
  lib,
  vimUtils,
  _sources',
}:

vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "File manipulation commands for vim-dirvish";
    homepage = "https://github.com/roginfarrer/vim-dirvish-dovish";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
