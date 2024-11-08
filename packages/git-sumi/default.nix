{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage rec {
  inherit (_sources.git-sumi) pname src version;

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
