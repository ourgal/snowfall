{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
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
)
