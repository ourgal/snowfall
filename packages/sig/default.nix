{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "sig";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-gZZ2aOsqVqGN3gCBZnBXzlFicMssNIEyRT688OuNMJc=";

  meta = with lib; {
    description = "Interactive grep (for streaming";
    homepage = "https://github.com/ynqa/sig";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sig";
  };
}
