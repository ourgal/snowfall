{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage rec {
  inherit (_sources.hledger-fmt) pname src version;

  cargoLock = _sources.hledger-fmt.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "An opinionated hledger's journal files formatter";
    homepage = "https://github.com/mondeja/hledger-fmt";
    changelog = "https://github.com/mondeja/hledger-fmt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hledger-fmt";
  };
}
