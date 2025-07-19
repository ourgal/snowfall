{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    meta = {
      description = "";
      homepage = "https://github.com/jzbor/nix-sweep";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "nix-sweep";
    };
  }
)
