{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.lobtui) pname version src;

  cargoLock = _sources.lobtui.cargoLock."Cargo.lock";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "TUI for lobste.rs website";
    homepage = "https://github.com/pythops/lobtui";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "lobtui";
  };
}
