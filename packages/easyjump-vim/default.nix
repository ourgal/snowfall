{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.easyjump-vim) pname version src;

  meta = with lib; {
    description = "The Vim motion you've always wanted";
    homepage = "https://github.com/girishji/easyjump.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
