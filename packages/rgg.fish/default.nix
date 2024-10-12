{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "rgg.fish";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "";
    homepage = "https://github.com/soraxas/rgg.fish";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rgg-fish";
    platforms = platforms.all;
  };
}
