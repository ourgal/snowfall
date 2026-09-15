{
  lib,
  rustPlatform,
  nix-update-script,
  _sources',
  namespace,
}:

rustPlatform.buildRustPackage (
  _finalAttrs:
  (
    lib.${namespace}.mkRustSource (_sources' ./.)
    // {
      passthru.updateScript = nix-update-script { };

      meta = {
        description = "A tools for partially converting multiple subscription to single singbox config";
        homepage = "https://github.com/bitxwave/subforge";
        license = lib.licenses.mit;
        maintainers = with lib.maintainers; [ zxc ];
        mainProgram = "subforge";
      };
    }
  )
)
