{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "lobtui";
  version = "0.3";

  src = fetchFromGitHub {
    owner = "pythops";
    repo = "lobtui";
    rev = "v${version}";
    hash = "sha256-Vc6fh0XbSYNCQWosP7cOfphJin6Z5AJdcfSNdd38cKs=";
  };

  cargoHash = "sha256-DUDERnhvnnGhjFH5KpIKmx1XNNAu2sDsf8DVhVfcd60=";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "TUI for lobste.rs website";
    homepage = "https://github.com/pythops/lobtui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ];
    mainProgram = "lobtui";
  };
}
