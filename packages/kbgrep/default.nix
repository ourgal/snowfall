{
  lib,
  stdenv,
  bashly,
  ripgrep,
  fzf,
  bat,
  cue,
  shellcheck,
  pkgs,
  namespace,
  makeWrapper,
}:
let
  pname = "kbgrep";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  nativeBuildInputs = [
    bashly
    cue
    shellcheck
    makeWrapper
  ];

  buildFlags = [
    "build"
    "lint"
  ];

  installPhase = ''
    runHook preInstall

    install -Dm755 kbg $out/bin/kbg
    wrapProgram $out/bin/kbg --prefix PATH : ${
      lib.makeBinPath [
        ripgrep
        fzf
        bat
      ]
    }

    runHook postInstall
  '';

  meta = with lib; {
    description = "A search tool optimized for knowledgebases";
    homepage = "https://github.com/pcrockett/kbgrep";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "kbg";
    platforms = platforms.all;
  };
}