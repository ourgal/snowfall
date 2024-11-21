{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.wiper
  // {
    buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Foundation ];

    meta = with lib; {
      description = "Disk analyser and cleanup tool";
      homepage = "https://github.com/ikebastuz/wiper";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "wiper";
    };
  }
)
