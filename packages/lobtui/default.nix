{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.lobtui
  // {
    buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

    meta = with lib; {
      description = "TUI for lobste.rs website";
      homepage = "https://github.com/pythops/lobtui";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "lobtui";
    };
  }
)
