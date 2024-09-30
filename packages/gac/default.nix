{
  lib,
  stdenv,
  fetchFromGitHub,
  bash,
}:

stdenv.mkDerivation {
  pname = "gac";
  version = "unstable-2022-07-22";

  src = fetchFromGitHub {
    owner = "devpolo";
    repo = "gac";
    rev = "2fb79127001913ece934cd6317c7762b8ab4efc7";
    hash = "sha256-U0pTqn3NU6uAL5HoLkBS7TSbRTizuQ4WnR5MmqMEC2E=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D gac.sh $out/bin/gac
    install -m755 -D variant/shell/gac-emojii.sh $out/bin/gace
    substituteInPlace $out/bin/gac --replace-fail /bin/zsh ${bash}/bin/bash
    echo 'gac "$@"' >> $out/bin/gac
    substituteInPlace $out/bin/gace --replace-fail /bin/zsh ${bash}/bin/bash
    echo >> $out/bin/gace
    echo 'gac "$@"' >> $out/bin/gace
    runHook postInstall
  '';

  meta = with lib; {
    description = "One simple command to format and faster your git add and git commit actions";
    homepage = "https://github.com/devpolo/gac";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gac";
    platforms = platforms.all;
  };
}
