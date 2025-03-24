{
  lib,
  rustPlatform,
  _sources',
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    meta = with lib; {
      description = "Generate progress bars from cron expressions";
      homepage = "https://github.com/neelkarma/jalm";
      license = licenses.unfree; # FIXME: nix-init did not found a license
      maintainers = with maintainers; [ zxc ];
      mainProgram = "jalm";
    };
  }
)
