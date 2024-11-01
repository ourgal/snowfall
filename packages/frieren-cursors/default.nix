{ lib, stdenv }:

stdenv.mkDerivation {
  pname = "frieren-cursors";
  version = "0.1.0";

  src = ./Frieren;

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons/frieren-cursors
    cp -pr ./* $out/share/icons/frieren-cursors
  '';

  meta = with lib; {
    description = "Frieren from Frieren:Beyond Journey's End. It was made by Noiire";
    homepage = "https://www.pling.com/p/2163665";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
