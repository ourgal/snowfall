{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage rec {
  inherit (_sources.convfmt) pname version src;

  cargoLock = _sources.convfmt.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Cli tool which can convert different formats";
    homepage = "https://github.com/oriontvv/convfmt";
    changelog = "https://github.com/oriontvv/convfmt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "convfmt";
  };
}
