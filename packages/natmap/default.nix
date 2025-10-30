{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  makeFlags = [ "REV_ID=${version}" ];

  installPhase = ''
    runHook preInstall
    install -Dm755 bin/natmap -t $out/bin
    runHook postInstall
  '';

  meta = {
    description = "TCP/UDP port mapping for full-cone NAT";
    homepage = "https://github.com/heiher/natmap";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "natmap";
    platforms = lib.platforms.all;
  };
}
