{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  bzip2,
  xz,
  zlib,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "dra";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "devmatteini";
    repo = "dra";
    rev = version;
    hash = "sha256-DRDAWskWejkLDwY9ClgIxkXCuC6VrqvofOQpqZv2m58=";
  };

  cargoHash = "sha256-CMUMPSHa3RnCo6gP4an4KK7FtqJCLkKtCThFrBKLzNU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    bzip2
    xz
    zlib
  ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  doCheck = false;

  meta = with lib; {
    description = "A command line tool to download release assets from GitHub";
    homepage = "https://github.com/devmatteini/dra";
    changelog = "https://github.com/devmatteini/dra/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dra";
  };
}
