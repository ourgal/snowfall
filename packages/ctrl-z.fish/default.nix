{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources."ctrl-z.fish") pname version src;

  meta = with lib; {
    description = "Makes it easy to toggle between $EDITOR and the shell using ctrl+z";
    homepage = "https://github.com/kpbaks/ctrl-z.fish";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
