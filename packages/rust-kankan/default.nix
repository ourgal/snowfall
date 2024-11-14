{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  _sources,
}:
rustPlatform.buildRustPackage rec {
  inherit (_sources.rust-kanban) pname version src;

  cargoHash = "sha256-Rui5fsLBx3ix2skRQVubEV8JabAaWbexA0L2D65JCZg=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ] ++ lib.optionals stdenv.isDarwin [ darwin.apple_sdk.frameworks.Security ];

  meta = with lib; {
    description = "A kanban board for the terminal built with ❤\u{fe0f} in Rust";
    homepage = "https://github.com/yashs662/rust_kanban";
    changelog = "https://github.com/yashs662/rust_kanban/blob/${src.rev}/Changelog.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rust-kanban";
  };
}
