{
  lib,
  vimUtils,
  _sources,
}:

vimUtils.buildVimPlugin {
  inherit (_sources.git-lens-vim) pname version src;

  meta = with lib; {
    description = "A vim9 plugin inspired by VSCode's GitLens";
    homepage = "https://github.com/Eliot00/git-lens.vim";
    license = licenses.agpl3Only;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
