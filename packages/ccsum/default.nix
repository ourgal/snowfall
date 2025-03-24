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
      description = "Convenient Checksum";
      homepage = "https://github.com/sevenc-nanashi/ccsum";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "ccsum";
    };
  }
)
