{
  lib,
  rustPlatform,
  pkg-config,
  sqlite,
  stdenv,
  darwin,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.ynk) pname version src;

  cargoHash = "sha256-VH6y3MMDL4tXGHFdn86flqpnpacRIB7/eOL2zF74d74=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ sqlite ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "A Better copy and paste for the terminal i.e cp and mv on steriods";
    homepage = "https://github.com/newtoallofthis123/ynk";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "ynk";
  };
}
