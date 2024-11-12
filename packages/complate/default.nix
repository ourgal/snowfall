{
  lib,
  rustPlatform,
  installShellFiles,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.complate) pname version src;

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    INSTALL_DIR=$(mktemp -d)
    $out/bin/complate autocomplete --shell bash --out $INSTALL_DIR
    $out/bin/complate autocomplete --shell zsh --out $INSTALL_DIR
    $out/bin/complate autocomplete --shell fish --out $INSTALL_DIR
    installShellCompletion --cmd complate \
      --bash $INSTALL_DIR/complate.bash \
      --zsh $INSTALL_DIR/_complate \
      --fish $INSTALL_DIR/complate.fish

    $out/bin/complate man --format manpages --out $INSTALL_DIR
    installManPage $INSTALL_DIR/*.1
  '';

  doCheck = false;

  cargoLock = _sources.complate.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "A powerful text templating tool";
    homepage = "https://github.com/replicadse/complate";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "complate";
  };
}
