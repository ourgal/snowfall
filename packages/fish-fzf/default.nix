{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-fzf) pname version src;

  meta = with lib; {
    description = "Ef-🐟-ient fish keybindings for fzf";
    homepage = "https://github.com/jethrokuan/fzf";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fzf";
    platforms = platforms.all;
  };
}
