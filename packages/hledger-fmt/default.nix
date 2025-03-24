{
  lib,
  rustPlatform,
  namespace,
  _sources',
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    meta = {
      description = "An opinionated hledger's journal files formatter";
      homepage = "https://github.com/mondeja/hledger-fmt";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "hledger-fmt";
    };
  }
)
