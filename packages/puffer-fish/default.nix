{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.puffer-fish) pname version src;

  meta = with lib; {
    description = "Text Expansions for Fish";
    homepage = "https://github.com/nickeb96/puffer-fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "puffer-fish";
    platforms = platforms.all;
  };
}
