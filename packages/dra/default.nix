{
  lib,
  rustPlatform,
  pkg-config,
  bzip2,
  xz,
  zlib,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "dra";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoHash = "sha256-RJXAy+OSfZXVDbCSSbHuL/87tmkUoUJfJ6bK5XvXN5A=";

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
