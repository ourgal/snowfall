{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  alsa-lib,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.code-radio-cli) pname src version;

  cargoLock = _sources.code-radio-cli.cargoLock."Cargo.lock";

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs =
    [ openssl ]
    ++ lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreAudio
      darwin.apple_sdk.frameworks.Security
    ]
    ++ lib.optionals stdenv.isLinux [ alsa-lib ];

  meta = with lib; {
    description = "A command line music radio client for https://coderadio.freecodecamp.org, written in Rust";
    homepage = "https://github.com/JasonWei512/code-radio-cli";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "code-radio-cli";
  };
}
