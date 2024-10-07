{
  lib,
  stdenv,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "gh-cp";
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
    install -m755 -D gh-cp $out/bin/gh-cp
    runHook postInstall
  '';

  meta = with lib; {
    description = "GitHub CLI extension to copy a file from a GitHub repository locally without cloning the repository";
    homepage = "https://github.com/mislav/gh-cp";
    license = licenses.unlicense;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-cp";
    platforms = platforms.all;
  };
}
