{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.cdo) pname version src;

  cargoLock = _sources.cdo.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Small command to run other commands in a given directory";
    homepage = "https://github.com/dotboris/cdo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cdo";
  };
}
