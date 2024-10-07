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
  namespace,
}:
let
  pname = "gw";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
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
