{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  sqlite,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "manga-tui";
  version = "0.2.0";

  src = fetchFromGitHub {
    owner = "josueBarretogit";
    repo = "manga-tui";
    rev = "v${version}";
    hash = "sha256-rGdncPEHbjA86RB0NjWgmci3Dz2c92o3mgC3eCt8Nxs=";
  };

  cargoLock = {
    lockFile = ./Cargo.lock;
    outputHashes = {
      "ratatui-image-1.0.5" = "sha256-bUPKCK3AKO5fnv7a8PApZTI0LPBShNBsvgyunLMdIqg=";
    };
  };

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    openssl
    sqlite
  ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "Terminal-based manga reader and downloader with image support";
    homepage = "https://github.com/josueBarretogit/manga-tui";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "manga-tui";
  };
}
