{ lib, stdenv }:

stdenv.mkDerivation {
  pname = "anya-cursors";
  version = "3.0.0";

  src = ./Anya_cursor_v3;

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons/anya-cursors
    cp -pr ./* $out/share/icons/anya-cursors
  '';

  meta = with lib; {
    description = "This is the modified version of Anya cursors since there is no official pack for linux";
    homepage = "https://www.pling.com/p/2169016";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}