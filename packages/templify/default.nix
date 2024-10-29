{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  pkgs,
  namespace,
}:
let
  pname = "templify";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname src version;

  cargoHash = "sha256-i6QNh3/kZeibdFlkzYVkIXPPgLmTTymcXXXztbuoj7g=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  doCheck = false;

  meta = with lib; {
    description = "A CLI tool to keep track of templates and generate files from them";
    homepage = "https://github.com/cophilot/templify";
    changelog = "https://github.com/cophilot/templify/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "templify";
  };
}
