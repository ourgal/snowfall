{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.wiper) pname version src;

  cargoLock = _sources.wiper.cargoLock."Cargo.lock";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Foundation ];

  meta = with lib; {
    description = "Disk analyser and cleanup tool";
    homepage = "https://github.com/ikebastuz/wiper";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "wiper";
  };
}
