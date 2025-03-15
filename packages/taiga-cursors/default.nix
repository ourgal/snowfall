{
  lib,
  stdenv,
  unzip,
}:

stdenv.mkDerivation {
  pname = "taiga-corsurs";
  version = "unstable-2025-03-06";

  src = ./.;

  dontBuild = true;

  nativeBuildInputs = [ unzip ];

  installPhase = ''
    install -dm 0755 $out/share/icons
    unzip *.zip -d $out/share/icons
  '';

  meta = {
    homepage = "https://www.pling.com/p/2268968/";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
