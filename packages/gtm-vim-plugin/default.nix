{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "gtm-vim-plugin";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Plugin for the Vim editor to be used with the Git Time Metric platform";
    homepage = "https://github.com/git-time-metric/gtm-vim-plugin";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
