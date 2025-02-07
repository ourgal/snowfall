{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  namespace,
  _sources,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.rustywatch
  // {
    buildInputs = lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.CoreServices
    ];

    meta = {
      description = "Live Reloading Built with Rust";
      homepage = "https://github.com/ak9024/rustywatch";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "rustywatch";
    };
  }
)
