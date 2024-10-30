{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "enhancd";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin rec {
  inherit (source) pname src version;

  meta = with lib; {
    description = "Rocket: A next-generation cd command with your interactive filter";
    homepage = "https://github.com/babarot/enhancd";
    changelog = "https://github.com/babarot/enhancd/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "enhancd";
    platforms = platforms.all;
  };
}
