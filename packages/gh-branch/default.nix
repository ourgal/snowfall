{ lib
, stdenv
, fetchFromGitHub
}:

stdenv.mkDerivation {
  pname = "gh-branch";
  version = "unstable-2023-12-06";

  src = fetchFromGitHub {
    owner = "mislav";
    repo = "gh-branch";
    rev = "7ed0aff7601dc4162e0cac8835ecd73409d8a009";
    hash = "sha256-yiRSXU/jLi067i+gBb3cEHTOuo+w3oEVsGL0NN6shl8=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D gh-branch $out/bin/gh-branch
    runHook postInstall
  '';

  meta = with lib; {
    description = "GitHub CLI extension for fuzzy finding, quickly switching between and deleting branches";
    homepage = "https://github.com/mislav/gh-branch";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-branch";
    platforms = platforms.all;
  };
}
