{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.simple-completion-language-server) pname version src;

  cargoLock = _sources.simple-completion-language-server.cargoLock."Cargo.lock";

  checkFlags = [ "--skip=citations" ];

  meta = with lib; {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "simple-completion-language-server";
  };
}
