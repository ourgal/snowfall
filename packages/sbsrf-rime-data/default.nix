{
  lib,
  stdenv,
  _sources',
  p7zip,
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  unpackCmd = ''
    7z x $src -otemp
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    cp -r ./* $out/share/rime-data
    substituteInPlace $out/share/rime-data/lua/sbxlm/radicals.lua \
      --replace-fail 'rime.api.get_user_data_dir() .. "/lua/sbxlm/radicals.txt"' "\"$out/share/rime-data/lua/sbxlm/radicals.txt\""
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = {
    description = "声笔输入法";
    homepage = "https://github.com/sbsrf/sbsrf";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
