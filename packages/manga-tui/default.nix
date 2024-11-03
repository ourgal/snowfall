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

  cargoHash = "sha256-IufJPCvUEWR5p4PrFlaiQPW9wyIFj/Pd/JHki69L6Es=";

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

  doCheck = false;

  meta = with lib; {
    description = "Terminal-based manga reader and downloader with image support";
    homepage = "https://github.com/josueBarretogit/manga-tui";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "manga-tui";
  };
}
