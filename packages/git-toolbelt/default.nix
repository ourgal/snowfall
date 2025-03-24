{
  lib,
  stdenvNoCC,
  makeWrapper,
  git,
  fzf,
  _sources',
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  inherit (_sources' ./.) pname version src;

  nativeBuildInputs = [ makeWrapper ];

  buildInputs = [
    git
    fzf # needed by git-fixup-with
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 git-* -t "$out"/bin

    rm "$out"/bin/git-local-commits
    rm "$out"/bin/git-root

    for exe in "$out"/bin/*; do
        wrapProgram "$exe" \
            --prefix PATH : "$out"/bin:${lib.makeBinPath finalAttrs.buildInputs}
    done

    runHook postInstall
  '';

  meta = {
    changelog = "https://github.com/nvie/git-toolbelt/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    description = "A suite of useful Git commands that aid with scripting or every day command line usage";
    homepage = "https://github.com/nvie/git-toolbelt";
    license = lib.licenses.bsd3;
    maintainers = with lib.maintainers; [ tomasajt ];
    platforms = lib.platforms.all;
  };
})
