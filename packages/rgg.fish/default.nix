{
  lib,
  _sources',
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "";
    homepage = "https://github.com/soraxas/rgg.fish";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
