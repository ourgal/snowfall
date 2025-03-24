{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons
    cp -pr miku-cursor-linux $out/share/icons
  '';

  meta = with lib; {
    description = "Hatsune Miku Cursors for Windows/Linux";
    homepage = "https://github.com/supermariofps/hatsune-miku-windows-linux-cursors";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    platforms = platforms.all;
  };
}
