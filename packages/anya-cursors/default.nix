{
  lib,
  stdenv,
  unzip,
}:

stdenv.mkDerivation {
  pname = "anya-cursors";
  version = "3.0.0";

  nativeBuildInputs = [ unzip ];

  src = ./.;

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons/anya-cursors
    unzip *.zip -d $out/share/icons
  '';

  meta = with lib; {
    description = "This is the modified version of Anya cursors since there is no official pack for linux";
    homepage = "https://www.pling.com/p/2169016";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
