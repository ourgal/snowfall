{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-color-scheme-switcher) pname version src;

  meta = with lib; {
    description = "A fish shell :fish: plugin to switch color schemes :rainbow";
    homepage = "https://github.com/h-matsuo/fish-color-scheme-switcher";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fish-color-scheme-switcher";
    platforms = platforms.all;
  };
}
