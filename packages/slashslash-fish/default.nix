{
  lib,
  fishPlugins,
  _sources,
}:

fishPlugins.buildFishPlugin {
  inherit (_sources.slashslash-fish) pname version src;

  meta = {
    description = "Remap // , foo// to arbitrary paths on disk; Enable cd cell//magic";
    homepage = "https://github.com/danzimm/slashslash.fish";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "slashslash-fish";
    platforms = lib.platforms.all;
  };
}
