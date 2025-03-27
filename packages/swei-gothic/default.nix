{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
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
    description = "Swei Gothic-derived from Noto Sans CJK font family with a more concise & modern look. 獅尾圓體基於思源黑體改造，擁有更加簡明現代化的字體家族";
    homepage = "https://github.com/max32002/swei-gothic";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
