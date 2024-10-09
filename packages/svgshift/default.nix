{
  lib,
  stdenv,
  namespace,
  pkgs,
}:
let
  pname = "svgshift";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname version src;

  buildPhase = "gcc svgshift.c -o svgshift";

  installPhase = "install -m755 -D ./svgshift $out/bin/svgshift";

  meta = with lib; {
    description = "Command-line utility to quickly adjust the colors in an svg file. Allows for quick and easy color manipulation of svg files by adjusting RGB and HSL values";
    homepage = "https://github.com/10xJSChad/svgshift";
    license = licenses.mpl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "svgshift";
    platforms = platforms.all;
  };
}
