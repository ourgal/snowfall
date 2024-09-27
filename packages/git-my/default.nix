{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "git-my";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "davidosomething";
    repo = "git-my";
    rev = version;
    hash = "sha256-sUgCIVnFfWazSwN6tUnraCRv6O3G1DF3i9rUGBPRZog=";
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D git-my $out/bin/git-my
    runHook postInstall
  '';

  meta = with lib; {
    description = "Lists a user's remote branches and shows if it was merged and/or available locally";
    homepage = "https://github.com/davidosomething/git-my";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-my";
    platforms = platforms.all;
  };
}
