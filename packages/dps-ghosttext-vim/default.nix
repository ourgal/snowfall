{
  lib,
  vimUtils,
  _sources,
}:

vimUtils.buildVimPlugin {
  inherit (_sources.dps-ghosttext-vim) pname version src;

  meta = {
    description = "GhostText plugin powered by denops.vim";
    homepage = "https://github.com/gamoutatsumi/dps-ghosttext.vim";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
