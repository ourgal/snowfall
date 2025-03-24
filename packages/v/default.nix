{
  lib,
  stdenv,
  installShellFiles,
  _sources',
}:
stdenv.mkDerivation {
  inherit (_sources' ./.) pname src version;

  dontBuild = true;

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    runHook preInstall
    install -Dm755 v -t $out/bin
    installManPage v.1
    runHook postInstall
  '';

  meta = with lib; {
    description = "Z for vim";
    homepage = "https://github.com/rupa/v";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "v";
    platforms = platforms.all;
  };
}
