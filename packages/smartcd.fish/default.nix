{
  lib,
  fishPlugins,
  _sources',
}:

fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = {
    description = "Mirrored from https://git.sr.ht/~ficd/smartcd.fish";
    homepage = "https://git.sr.ht/~ficd/smartcd.fish";
    license = lib.licenses.isc;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
