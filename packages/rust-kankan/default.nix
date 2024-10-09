{
  lib,
  rustPlatform,
  pkg-config,
  openssl,
  stdenv,
  darwin,
  namespace,
  pkgs,
}:
let
  pname = "rust-kanban";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoHash = "sha256-5AXVl2yqpVoMlK2WP0mZL6vn+Xy6fdVi7oCOh8LaaFE=";

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
