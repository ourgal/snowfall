{
  lib,
  stdenv,
  fetchzip,
  _sources,
}:
stdenv.mkDerivation rec {
  inherit (_sources.hypergrep) pname version;

  src = fetchzip {
    url = "https://github.com/p-ranav/hypergrep/releases/download/v${version}/hg_${version}.zip";
    hash = "sha256-L4DRzWqMB+wWmbbF54Fuu4LQjfbu9FmAK3pMAmBKpAk=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D hg $out/bin/hg
    runHook postInstall
  '';

  meta = with lib; {
    description = "Recursively search directories for a regex pattern";
    homepage = "https://github.com/p-ranav/hypergrep";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hypergrep";
    platforms = platforms.all;
  };
}
