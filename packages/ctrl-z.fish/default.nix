{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "ctrl-z.fish";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Makes it easy to toggle between $EDITOR and the shell using ctrl+z";
    homepage = "https://github.com/kpbaks/ctrl-z.fish";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ctrl-z-fish";
    platforms = platforms.all;
  };
}
