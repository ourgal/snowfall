{
  lib,
  stdenv,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.mosdns-cn) pname version src;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 mosdns-cn -t $out/bin
    runHook postInstall
  '';

  meta = with lib; {
    description = "A simple DNS forwarder that can make life easier. (Not maintained";
    homepage = "https://github.com/IrineSistiana/mosdns-cn";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mosdns-cn";
    platforms = platforms.x86_64;
  };
}
