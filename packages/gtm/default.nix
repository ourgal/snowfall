{
  lib,
  stdenv,
  fetchzip,
  _sources,
}:
stdenv.mkDerivation rec {
  inherit (_sources.gtm) pname version;

  src = fetchzip {
    hash = "sha256-Jb8JCKJ4WvA7hLwDkywnBIW+xOYrr3Uww3/OUUk+ZDI=";
    url = "https://github.com/git-time-metric/gtm/releases/download/v${version}/gtm.v${version}.linux.tar.gz";
  };

  dontBuild = true;

  installPhase = "install -D -m0755 gtm $out/bin/gtm";

  meta = with lib; {
    description = "Simple, seamless, lightweight time tracking for Git";
    homepage = "https://github.com/git-time-metric/gtm";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gtm";
    platforms = platforms.all;
  };
}
