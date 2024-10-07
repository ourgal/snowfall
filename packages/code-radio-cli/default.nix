{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  alsa-lib,
  namespace,
}:
let
  pname = "code-radio-cli";
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
