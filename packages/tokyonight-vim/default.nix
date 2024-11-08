{
  lib,
  vimUtils,
  _sources,
}:
vimUtils.buildVimPlugin {
  inherit (_sources.tokyonight-vim) pname version src;

  meta = with lib; {
    description = "A clean, dark vim colorscheme that celebrates the lights of downtown Tokyo at night, based on a VSCode theme by @enkia with the same name [Archived because I'm no longer using this";
    homepage = "https://github.com/ghifarit53/tokyonight-vim";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
