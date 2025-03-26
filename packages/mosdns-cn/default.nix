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
    install -Dm755 mosdns-cn -t $out/bin
    runHook postInstall
  '';

  nativeBuildInputs = [ p7zip ];

  meta = with lib; {
    description = "A simple DNS forwarder that can make life easier. (Not maintained";
    homepage = "https://github.com/IrineSistiana/mosdns-cn";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mosdns-cn";
    platforms = platforms.x86_64;
  };
}
