{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.sig) pname version src;

  cargoHash = "sha256-gZZ2aOsqVqGN3gCBZnBXzlFicMssNIEyRT688OuNMJc=";

  meta = with lib; {
    description = "Interactive grep (for streaming";
    homepage = "https://github.com/ynqa/sig";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sig";
  };
}
