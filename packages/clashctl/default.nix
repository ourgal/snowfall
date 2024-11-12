{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.clashctl) pname version src;

  cargoLock = _sources.clashctl.cargoLock."Cargo.lock";

  doCheck = false;

  meta = with lib; {
    description = "CLI for interacting with clash";
    homepage = "https://github.com/George-Miao/clashctl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "clashctl";
  };
}
