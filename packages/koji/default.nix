{
  lib,
  rustPlatform,
  pkg-config,
  libgit2,
  openssl,
  zlib,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "koji";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

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
