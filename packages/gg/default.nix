{
  lib,
  stdenv,
  fetchFromGitHub,
  installShellFiles,
  namespace,
}:
let
  pname = "gg";
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

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 bin/gg $out/bin/gg
    installManPage ./man/gg.1
    runHook postInstall
  '';

  meta = with lib; {
    description = "Git Goodies: At-A-Glance, Efficient, and Aesthetically Pleasing Git Shortcuts";
    homepage = "https://github.com/qw3rtman/gg";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gg";
    platforms = platforms.all;
  };
}
