{
  lib,
  stdenv,
  pkgs,
  namespace,
}:
let
  pname = "puffer-fish";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  meta = with lib; {
    description = "Text Expansions for Fish";
    homepage = "https://github.com/nickeb96/puffer-fish";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "puffer-fish";
    platforms = platforms.all;
  };
}
