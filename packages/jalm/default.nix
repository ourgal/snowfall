{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.jalm) pname version src;

  cargoLock = _sources.jalm.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Generate progress bars from cron expressions";
    homepage = "https://github.com/neelkarma/jalm";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "jalm";
  };
}
