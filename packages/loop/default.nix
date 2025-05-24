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
      description = "UNIX's missing `loop` command";
      homepage = "https://github.com/Miserlou/Loop";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "loop";
    };
  }
)
