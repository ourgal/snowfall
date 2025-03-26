{
  lib,
  stdenv,
  _sources',
}:

stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 $src $out/bin/chinadns-ng
    runHook postInstall
  '';

  meta = {
    description = "Chinadns 重构增强版，支持域名分流、ipset/nftset、UDP/TCP/DoT";
    homepage = "https://github.com/zfl9/chinadns-ng";
    license = lib.licenses.agpl3Only;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "chinadns-ng";
    platforms = [ "x86_64-linux" ];
  };
}
