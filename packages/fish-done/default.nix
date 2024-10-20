{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-done";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "A fish-shell package to automatically receive notifications when long processes finish";
    homepage = "https://github.com/franciscolourenco/done";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "done";
    platforms = platforms.all;
  };
}
