{
  lib,
  stdenv,
  emacs,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname version src;

  dontBuild = true;

  runtimeInputs = [ emacs ];

  installPhase = ''
    runHook preInstall
    install -m755 -D org-export $out/bin/org-export
    mkdir -p $out/lib
    cp *.el $out/lib/
    cp ${./org-export-markdown.el} $out/lib/org-export-markdown.el
    substituteInPlace $out/bin/org-export \
      --replace-fail '$(dirname $0)' $out/lib
    runHook postInstall
  '';

  meta = with lib; {
    description = "Batch export of org-mode files from the command line";
    homepage = "https://github.com/nhoffman/org-export";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "org-export";
    platforms = platforms.all;
  };
}
