{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-f) pname version src;

  meta = with lib; {
    description = "Quickly get to a previously mentioned file in fish shell -- z for files";
    homepage = "https://github.com/sudormrfbin/f";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
