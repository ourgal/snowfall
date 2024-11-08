{
  lib,
  _sources,
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.vim-visual-star-search) pname version src;

  meta = with lib; {
    description = "Start a * or # search from a visual block";
    homepage = "https://github.com/ourgal/vim-visual-star-search";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
