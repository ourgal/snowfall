{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "git-sumi";
  version = "0.0.9";

  src = fetchFromGitHub {
    owner = "welpo";
    repo = "git-sumi";
    rev = "v${version}";
    hash = "sha256-ZSpQJeiGn6J8G/35PTW6pRzPhTRW1Op3gakx/yXB3Zc=";
  };

  cargoHash = "sha256-a6WIN2O5M7gCxeCrFb+U0goTaAVfyG7Sgg8qL60gu68=";

  doCheck = false;

  meta = with lib; {
    description = "The non-opinionated Rust-based commit message linter";
    homepage = "https://github.com/welpo/git-sumi";
    changelog = "https://github.com/welpo/git-sumi/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "git-sumi";
  };
}
