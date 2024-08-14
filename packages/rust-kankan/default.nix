{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  openssl,
  stdenv,
  darwin,
}:

rustPlatform.buildRustPackage rec {
  pname = "rust-kanban";
  version = "0.10.4";

  src = fetchFromGitHub {
    owner = "yashs662";
    repo = "rust_kanban";
    rev = "v${version}";
    hash = "sha256-1sCc5ChDTYEo+WYsyYvmxJJ/JXtd/uPtUeKBjYjXcHU=";
  };

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
