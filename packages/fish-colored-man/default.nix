{
  lib,
  fishPlugins,
  _sources,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-colored-man) pname version src;

  meta = with lib; {
    description = "Color-enabled man pages plugin for fish-shell";
    homepage = "https://github.com/decors/fish-colored-man";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
