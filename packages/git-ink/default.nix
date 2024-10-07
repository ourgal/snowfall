{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-ink";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  inherit (source) version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  installPhase = ''
    runHook preInstall
    install -m755 -D git-ink $out/bin/git-ink
    runHook postInstall
  '';

  meta = with lib; {
    description = "Annotate your git branches";
    homepage = "https://github.com/davidosomething/git-ink";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-ink";
    platforms = platforms.all;
  };
}
