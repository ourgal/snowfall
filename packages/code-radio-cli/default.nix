{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  alsa-lib,
  namespace,
  pkgs,
}:
let
  pname = "code-radio-cli";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname src version;

  cargoHash = "sha256-W2c63beCqEIB0SxrpC0ptxsoKrHSt+TId98LcX7RNBg=";

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
