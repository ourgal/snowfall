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
    install -Dm755 hg $out/bin/hypergrep
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = with lib; {
    description = "Recursively search directories for a regex pattern";
    homepage = "https://github.com/p-ranav/hypergrep";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hypergrep";
    platforms = platforms.x86_64-linux;
  };
}
