{
  lib,
  stdenv,
  fetchurl,
  _sources',
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version;

  src = fetchurl {
    url = "https://github.com/Hejsil/cache/releases/download/${version}/cache-x86_64-linux-musl";
    hash = "sha256-9valEzM3Ish4SEDOEKQsqcjW86a7SWS8ey36oG0p+MU=";
  };

  phases = [ "installPhase" ];

  installPhase = ''
    runHook preInstall
    install -m755 -D $src $out/bin/cache
    runHook postInstall
  '';

  meta = with lib; {
    description = "Provides caching for any command line tool that does not have it";
    homepage = "https://github.com/Hejsil/cache";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cache";
    platforms = lib.platforms.linux;
  };
}
