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
  pname = "gw";
  version = "0.3.2";

  src = fetchFromGitHub {
    owner = "daniel7grant";
    repo = "gw";
    rev = "v${version}";
    hash = "sha256-oexh8/iPVdJoU5PzEypho4+LSsAkHHByz0ZNCWYtHNA=";
  };

  cargoHash = "sha256-p4E3c7vBqSb4d7Ki9jLA1mI8u7rHyFA78T30oSgq+Uc=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    libgit2
    openssl
    zlib
  ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  env = {
    OPENSSL_NO_VENDOR = true;
  };

  doCheck = false;

  meta = with lib; {
    description = "Watch local git repositories, keep in sync with remote and run commands";
    homepage = "https://github.com/daniel7grant/gw";
    changelog = "https://github.com/daniel7grant/gw/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gw";
  };
}
