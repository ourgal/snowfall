{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "fish-sponge";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Clean fish history from typos automatically";
    homepage = "https://github.com/meaningful-ooo/sponge";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sponge";
    platforms = platforms.all;
  };
}
