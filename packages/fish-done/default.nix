{
  lib,
  _sources,
  fishPlugins,
}:
fishPlugins.buildFishPlugin {
  inherit (_sources.fish-done) pname version src;

  meta = with lib; {
    description = "A fish-shell package to automatically receive notifications when long processes finish";
    homepage = "https://github.com/franciscolourenco/done";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "done";
    platforms = platforms.all;
  };
}
