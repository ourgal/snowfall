{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "git-sumi";
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
