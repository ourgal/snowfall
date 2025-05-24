{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources',
  namespace,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    buildInputs = lib.optionals stdenv.hostPlatform.isDarwin [ darwin.apple_sdk.frameworks.Accelerate ];

    meta = with lib; {
      description = "Utility to compress image files while maintaining quality";
      homepage = "https://github.com/siiptuo/pio";
      license = licenses.agpl3Plus;
      maintainers = with maintainers; [ liassica ];
      mainProgram = "pio";
    };
  }
)
