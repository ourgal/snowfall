{
  lib,
  stdenv,
  unzip,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.hypergrep) pname version src;

  nativeBuildInputs = [ unzip ];

  unpackPhase = ''
    runHook preUnpack
    LANG=en_US.UTF-8 unzip -qq "$src"
    runHook postUnpack
  '';

  sourceRoot = ".";

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 hg -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "Recursively search directories for a regex pattern";
    homepage = "https://github.com/p-ranav/hypergrep";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hypergrep";
    platforms = platforms.all;
  };
}
