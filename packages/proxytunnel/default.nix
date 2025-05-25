{
  lib,
  stdenv,
  _sources',
  openssl,
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  buildInputs = [ openssl ];

  makeFlags = [ "prefix=${placeholder "out"}" ];

  installPhase = ''
    runHook preInstall
    install -Dm755 proxytunnel -t $out/bin
    runHook postInstall
  '';

  meta = {
    description = "Stealth tunneling through HTTP(S) proxies";
    homepage = "https://github.com/proxytunnel/proxytunnel";
    changelog = "https://github.com/proxytunnel/proxytunnel/blob/${src.rev}/CHANGES";
    license = lib.licenses.gpl2Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "proxytunnel";
    platforms = lib.platforms.all;
  };
}
