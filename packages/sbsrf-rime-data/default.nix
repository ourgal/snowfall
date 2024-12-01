{
  lib,
  stdenv,
  fetchzip,
  _sources,
}:
stdenv.mkDerivation rec {
  inherit (_sources.sbsrf-rime-data) pname version;

  src = fetchzip {
    url = "https://github.com/sbsrf/sbsrf/releases/download/${version}/sbsrf.zip";
    hash = "sha256-ZLOaPDciqVETFnNJDP71gS6dZ5p7hr5vv5YWHtDaO6M=";
  };

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    rm ./default.custom.yaml
    cp -r ./* $out/share/rime-data
    runHook postInstall
  '';

  meta = with lib; {
    description = "声笔输入法";
    homepage = "https://github.com/sbsrf/sbsrf";
    license = licenses.bsd3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sbsrf";
    platforms = platforms.all;
  };
}
