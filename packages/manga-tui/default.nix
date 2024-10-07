{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  sqlite,
  stdenv,
  darwin,
  namespace,
  bzip2,
  zstd,
}:
let
  pname = "manga-tui";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

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
