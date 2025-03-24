{
  lib,
  _sources',
  vimUtils,
}:
vimUtils.buildVimPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "Auto-completion for Vim's command-line";
    homepage = "https://github.com/girishji/vimsuggest";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
