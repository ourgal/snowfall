{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
  namespace,
}:
let
  pname = "lobtui";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
