{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  installPhase = ''
    runHook preInstall
    for folder in "CJK JP" "CJK SC" "CJK TC"; do
      cd "$folder"
      install -Dm0644 *.ttf -t $out/share/fonts/truetype
      cd ..
    done
    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "https://github.com/max32002/swei-nut-sans";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
