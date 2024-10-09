{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "lobtui";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-DUDERnhvnnGhjFH5KpIKmx1XNNAu2sDsf8DVhVfcd60=";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "TUI for lobste.rs website";
    homepage = "https://github.com/pythops/lobtui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "lobtui";
  };
}
