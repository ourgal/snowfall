{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-sponge) pname version src;

  meta = with lib; {
    description = "Clean fish history from typos automatically";
    homepage = "https://github.com/meaningful-ooo/sponge";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sponge";
    platforms = platforms.all;
  };
}
