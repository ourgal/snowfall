{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "gh-branch";
  source = lib.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit pname;
  version = "unstable-${source.date}";

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
    install -m755 -D gh-branch $out/bin/gh-branch
    runHook postInstall
  '';

  meta = with lib; {
    description = "GitHub CLI extension for fuzzy finding, quickly switching between and deleting branches";
    homepage = "https://github.com/mislav/gh-branch";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-branch";
    platforms = platforms.all;
  };
}
