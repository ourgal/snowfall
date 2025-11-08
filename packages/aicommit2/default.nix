{
  lib,
  stdenv,
  _sources',
  nodejs,
  pnpm,
}:

stdenv.mkDerivation rec {
  inherit (_sources' ./.) pname version src;

  pnpmDeps = pnpm.fetchDeps {
    inherit pname version src;
    hash = "sha256-CQJ9CqUxxRZr4iJCh/scvA/9pRZYT48x/dRsBxBaoOM=";
  };

  nativeBuildInputs = [
    nodejs
    pnpm.configHook
  ];
  buildInputs = [ nodejs ];

  buildPhase = ''
    runHook preBuild
    sed -i 's/"version": "0.0.0-semantic-release"/"version": "${version}"/' package.json
    pnpm build
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p $out/{bin,lib/aicommit2}
    cp -r {dist,node_modules} $out/lib/aicommit2

    ln -s $out/lib/aicommit2/dist/cli.mjs $out/bin/aicommit2

    runHook postInstall
  '';

  meta = {
    description = "A Reactive CLI that generates git commit messages with Ollama, ChatGPT, Gemini, Claude, Mistral and other AI";
    homepage = "https://github.com/tak-bro/aicommit2";
    changelog = "https://github.com/tak-bro/aicommit2/blob/${src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "aicommit2";
    platforms = lib.platforms.all;
  };
}
