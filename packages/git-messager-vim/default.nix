{
  lib,
  vimUtils,
  _sources,
}:

vimUtils.buildVimPlugin {
  inherit (_sources.git-messenger-vim) pname version src;

  meta = with lib; {
    description = "Vim and Neovim plugin to reveal the commit messages under the cursor";
    homepage = "https://github.com/rhysd/git-messenger.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
