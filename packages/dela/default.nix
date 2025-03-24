{
  lib,
  rustPlatform,
  namespace,
  _sources',
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    doCheck = false;

    meta = {
      description = "A task runner that delegates the work to other tools";
      homepage = "https://github.com/aleyan/dela";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "dela";
    };
  }
)
