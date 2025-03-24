{
  lib,
  stdenv,
  _sources',
  pnpm_9,
  nodejs,
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  nativeBuildInputs = [
    pnpm_9.configHook
    nodejs
  ];

  pnpmDeps = pnpm_9.fetchDeps {
    inherit pname version src;
    hash = "sha256-Zc5GE2sl1M4uKkq3yKUSxepATmAv5JBNXqrUlKjs3vU=";
  };

  buildPhase = ''
    runHook preBuild

    pnpm build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    cp -r ./dist $out

    runHook postInstall
  '';

  meta = {
    description = "A Dashboard Using Clash API";
    homepage = "https://github.com/Zephyruso/zashboard";
    changelog = "https://github.com/Zephyruso/zashboard/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
