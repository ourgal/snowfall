{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.termsand) pname version src;

  cargoLock = _sources.termsand.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/ourgal/termsand";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "termsand";
  };
}
