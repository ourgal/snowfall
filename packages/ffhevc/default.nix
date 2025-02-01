{
  lib,
  stdenv,
  fetchzip,
  installShellFiles,
}:
stdenv.mkDerivation rec {
  pname = "ffhevc";
  version = "4.5.15";
  src = fetchzip {
    url = "https://phoenixnap.dl.sourceforge.net/project/ffhevc/ffhevc-${version}.tar.gz";
    hash = "sha256-HCy+G0RHVYAnsVbsmKpmG/AgSkm+rSsdpQWIGnNW8oY=";
  };

  nativeBuildInputs = [ installShellFiles ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D {ffhevc,hdr} -t $out/bin
    installManPage ffhevc.1
    runHook postInstall
  '';

  meta = with lib; {
    description = "ffhevc is a small yet quite capable Bash shell script written for the GNU/Linux and BSD operating systems that makes it easy to encode video files to H.265/HEVC video using the FFmpeg encoder and the libx265 library.";
    homepage = "https://ffhevc.teambelgium.net";
    license = licenses.gpl3;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ffhevc";
    platforms = platforms.all;
  };
}
