{
  lib,
  stdenv,
  _sources',
  pnpm_9,
  nodejs,
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  buildInputs = [ nodejs ];

  nativeBuildInputs = [ pnpm_9.configHook ];

  pnpmDeps = pnpm_9.fetchDeps {
    fetcherVersion = 1;
    inherit pname version src;
    hash = "sha256-DnGqrwr4ULh9sRcZewP3ZA45DmnlwS1/keYAE6rbd78=";
  };

  buildPhase = ''
    runHook preBuild

    pnpm build

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib/zhlint}
    cp package.json $out/lib/zhlint
    mv {dist,bin,lib,node_modules} $out/lib/zhlint
    ln -s $out/lib/zhlint/bin/index.js $out/bin/zhlint
    chmod a+x $out/bin/zhlint

    runHook postInstall
  '';

  meta = {
    description = "A linting tool for Chinese language";
    homepage = "https://github.com/zhlint-project/zhlint";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "zhlint";
    platforms = lib.platforms.all;
  };
}
