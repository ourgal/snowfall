{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.visual-split-vim) pname version src;

  meta = with lib; {
    description = "Vim plugin to control splits with visual selections or text objects";
    homepage = "https://github.com/wellle/visual-split.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
