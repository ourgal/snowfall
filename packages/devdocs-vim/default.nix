{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.devdocs-vim) pname version src;

  meta = with lib; {
    description = "Lookup  API documentation from devdocs.io without leaving Vim";
    homepage = "https://github.com/girishji/devdocs.vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
