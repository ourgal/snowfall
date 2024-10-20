{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "fish-bd";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.fishPlugins.buildFishPlugin {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Quickly go back to a parent directory up in your current working directory tree. Don't write 'cd ../../..' redundantly, use bd instead";
    homepage = "https://github.com/0rax/fish-bd";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fish-bd";
    platforms = platforms.all;
  };
}
