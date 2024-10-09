{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  sqlite,
  stdenv,
  darwin,
  namespace,
  bzip2,
  zstd,
  pkgs,
}:
let
  pname = "manga-tui";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-yf0hISz/jHtrO1clTSIKfxFiwI+W0Mu3mY+XW6+ynJU=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [
    bzip2
    openssl
    sqlite
    zstd
  ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  env = {
    ZSTD_SYS_USE_PKG_CONFIG = true;
  };

  meta = with lib; {
    description = "Terminal-based manga reader and downloader with image support";
    homepage = "https://github.com/josueBarretogit/manga-tui";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "manga-tui";
  };
}
