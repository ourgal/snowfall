{
  lib,
  stdenv,
  gnutar,
}:

stdenv.mkDerivation {
  pname = "ellen-joe-corsurs";
  version = "unstable-2025-03-01";

  src = ./.;

  dontBuild = true;

  nativeBuildInputs = [ gnutar ];

  installPhase = ''
    install -dm 0755 $out/share/icons
    tar zxvf *.tar.gz -C $out/share/icons
  '';

  meta = {
    homepage = "https://www.pling.com/p/2264094/";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
