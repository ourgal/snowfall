{
  lib,
  rustPlatform,
  fetchFromGitHub,
  stdenv,
  darwin,
  namespace,
}:
let
  pname = "wiper";
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

  cargoHash = "sha256-gYWTv0AXOmpx9Nc8akBMVWkESI0AtnGgvfH9hQZ0peo=";

  buildInputs = lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Foundation ];

  meta = with lib; {
    description = "Disk analyser and cleanup tool";
    homepage = "https://github.com/ikebastuz/wiper";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "wiper";
  };
}
