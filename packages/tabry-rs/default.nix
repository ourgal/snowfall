{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.tabry-rs) pname version src;

  cargoLock = _sources.tabry-rs.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "Shell (tab) completion engine";
    homepage = "https://github.com/evanbattaglia/tabry-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tabry-rs";
  };
}
