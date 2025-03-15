{
  lib,
  stdenv,
  unzip,
}:

stdenv.mkDerivation {
  pname = "frieren-cursors";
  version = "0.1.0";

  src = ./.;

  nativeBuildInputs = [ unzip ];

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons/frieren-cursors
    unzip *.zip -d $out/share/icons
  '';

  meta = with lib; {
    description = "Frieren from Frieren:Beyond Journey's End. It was made by Noiire";
    homepage = "https://www.pling.com/p/2163665";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
