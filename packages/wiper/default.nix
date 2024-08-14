{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "wiper";
  version = "0.2.1";

  src = fetchFromGitHub {
    owner = "ikebastuz";
    repo = "wiper";
    rev = "v${version}";
    hash = "sha256-IheSAPk1l6wJ2v4RLPIPvY/5XMfh+vJLyQ/Lc7RrCJQ=";
  };

  cargoHash = "sha256-gYWTv0AXOmpx9Nc8akBMVWkESI0AtnGgvfH9hQZ0peo=";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Foundation ];

  meta = with lib; {
    description = "Disk analyser and cleanup tool";
    homepage = "https://github.com/ikebastuz/wiper";
    license = licenses.mit;
    maintainers = with maintainers; [ ];
    mainProgram = "wiper";
  };
}
