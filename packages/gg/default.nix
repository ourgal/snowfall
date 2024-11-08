{
  lib,
  stdenv,
  installShellFiles,
  _sources,
}:
stdenv.mkDerivation {
  inherit (_sources.gg) pname src version;

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
