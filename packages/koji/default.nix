{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "koji";
  version = "2.2.0";

  src = fetchFromGitHub {
    owner = "cococonscious";
    repo = "koji";
    rev = version;
    hash = "sha256-2kBjHX7izo4loJ8oyPjE9FtCvUODC3Sm4T8ETIdeGZM=";
  };

  cargoHash = "sha256-owppYDt0YdWoDvfmzVfiIPjLgTAT9eTI1LpRr4Y3XQA=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    libgit2
    openssl
    zlib
  ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };

  meta = with lib; {
    description = "An interactive CLI for creating conventional commits";
    homepage = "https://github.com/cococonscious/koji";
    changelog = "https://github.com/cococonscious/koji/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "koji";
  };
}
