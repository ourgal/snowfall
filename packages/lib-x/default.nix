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
  zathura,
  _sources,
}:

stdenv.mkDerivation {
  inherit (_sources.lib-x) pname version src;

  nativeBuildInputs = [ makeWrapper ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 lib-x -t $out/bin
    substituteInPlace $out/bin/lib-x \
      --replace-fail 'open "$book_path"' 'zathura "$book_path"'
    wrapProgram $out/bin/lib-x --prefix PATH:${
      lib.makeBinPath [
        calibre
        jq
        fzf
        glow
        gum
        xdg-utils
        zathura
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
