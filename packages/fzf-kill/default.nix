{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "fzf-kill";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D ./fzf-kill $out/bin/fzf-kill
    runHook postInstall
  '';

  meta = with lib; {
    description = "The no-nonsense task killer for your terminal";
    homepage = "https://github.com/Zeioth/fzf-kill";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "fzf-kill";
    platforms = platforms.all;
  };
}
