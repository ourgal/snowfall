{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "wiper";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

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
