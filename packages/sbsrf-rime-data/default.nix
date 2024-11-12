{
  stdenv,
  unzip,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.sbsrf-rime-data) pname version src;

  sourceRoot = ".";

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    runHook preUnpack
    LANG=en_US.UTF-8 unzip -qq "$src"
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/rime-data
    rm ./default.custom.yaml
    cp -r ./* $out/share/rime-data
    runHook postInstall
  '';
}
