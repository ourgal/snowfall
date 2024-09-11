{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "svgshift";
  version = "unstable-2024-08-20";

  src = fetchFromGitHub {
    owner = "10xJSChad";
    repo = "svgshift";
    rev = "5a24a7e661a6056c994d1bf1b4ef63b8dd506ada";
    hash = "sha256-je9ZbXTFKq3tA3aE0QTu70Sco45rQyLW+lS6//zNCmw=";
  };

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
