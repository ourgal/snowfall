{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "gh-cp";
  version = "unstable-2021-11-08";

  src = fetchFromGitHub {
    owner = "mislav";
    repo = "gh-cp";
    rev = "58afdf5b5e1acfe71fce2390f6431003505ae0aa";
    hash = "sha256-Ih3Wit0nnB8PrgbeZEuhTNVPCrwMWBmKMJSGmgLIrVY=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D gh-cp $out/bin/gh-cp
    runHook postInstall
  '';

  meta = with lib; {
    description = "GitHub CLI extension to copy a file from a GitHub repository locally without cloning the repository";
    homepage = "https://github.com/mislav/gh-cp";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-cp";
    platforms = platforms.all;
  };
}
