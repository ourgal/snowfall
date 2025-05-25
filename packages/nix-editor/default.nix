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
      description = "A simple rust program to edit NixOS configuration files with just a command";
      homepage = "https://github.com/snowfallorg/nix-editor";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "nix-editor";
    };
  }
)
