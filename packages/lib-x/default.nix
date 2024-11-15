{
  lib,
  stdenv,
  makeWrapper,
  calibre,
  jq,
  fzf,
  glow,
  gum,
  xdg-utils,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.lib-x) pname version src;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 lib-x -t $out/bin
    wrapProgram $out/bin/lib-x --prefix PATH:${
      lib.makeBinPath [
        calibre
        jq
        fzf
        glow
        gum
        xdg-utils
      ]
    }
    runHook postInstall
  '';

  meta = with lib; {
    description = "A cli wrapper over calibredb";
    homepage = "https://github.com/Benex254/lib-x";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "lib-x";
    platforms = platforms.all;
  };
}
