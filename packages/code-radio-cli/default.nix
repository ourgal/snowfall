{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  alsa-lib,
}:

rustPlatform.buildRustPackage rec {
  pname = "code-radio-cli";
  version = "1.0.5";

  src = fetchFromGitHub {
    owner = "JasonWei512";
    repo = "code-radio-cli";
    rev = "v${version}";
    hash = "sha256-H2mnMWMJcFZIWHRz4QzM7ZwfbJ0N/ycu4g2W7187E3A=";
  };

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
