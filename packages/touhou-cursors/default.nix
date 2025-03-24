{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  installPhase = ''
    install -dm 0755 $out/share/icons
    for dir in */; do
      cp -pr "$dir" $out/share/icons
    done
  '';

  meta = {
    description = "Created by 夜夢（よるむ） , converted by muha0644";
    homepage = "https://github.com/mabequinho/touhou-cursors";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
