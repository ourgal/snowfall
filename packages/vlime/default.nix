{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.vlime) pname version src;

  meta = with lib; {
    description = "A Common Lisp dev environment for Vim (and Neovim";
    homepage = "https://github.com/vlime/vlime";
    changelog = "https://github.com/vlime/vlime/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
