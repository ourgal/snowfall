{
  lib,
  fishPlugins,
  _sources',
}:
fishPlugins.buildFishPlugin {
  inherit (_sources' ./.) pname version src;

  meta = with lib; {
    description = "A plugin to do a web search via fish. Inspired by oh-my-zsh/web-search";
    homepage = "https://github.com/veirt/web-search.fish";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
