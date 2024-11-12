{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.sig) pname version src;

  cargoLock = _sources.sig.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Interactive grep (for streaming";
    homepage = "https://github.com/ynqa/sig";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sig";
  };
}
