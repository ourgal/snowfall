{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage rec {
  inherit (_sources.hledger-fmt) pname src version;

  cargoHash = "sha256-V8uRwRQwc1MZ0jNPoNjzfqY3CXFz5p4h4TbKYkd9nKw=";

  meta = with lib; {
    description = "An opinionated hledger's journal files formatter";
    homepage = "https://github.com/mondeja/hledger-fmt";
    changelog = "https://github.com/mondeja/hledger-fmt/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "hledger-fmt";
  };
}
