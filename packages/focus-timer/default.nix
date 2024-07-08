{
  stdenv,
  lib,
  fetchurl,
  alsa-lib,
  autoPatchelfHook,
  ...
}:

stdenv.mkDerivation rec {
  pname = "focus-timer";
  version = "1.4.3";

  src = fetchurl {
    url = "https://github.com/ayoisaiah/focus/releases/download/v${version}/focus_${version}_linux_amd64.tar.gz";
    hash = "sha256-d4eiF2FxtUruZRjHkrJhuYPzTF1CdmLoJUvnt7ySXbo=";
  };

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [ alsa-lib ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D focus $out/bin/focus
    runHook postInstall
  '';

  meta = with lib; {
    homepage = "https://github.com/ayoisaiah/focus";
    description = "A fully featured productivity timer for the command line, based on the Pomodoro Technique.";
    platforms = platforms.linux;
  };
}
