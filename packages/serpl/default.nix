{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.serpl) pname version src;

  cargoLock = _sources.serpl.cargoLock."Cargo.lock";

  meta = with lib; {
    description = "A simple terminal UI for search and replace, ala VS Code";
    homepage = "https://github.com/yassinebridi/serpl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serpl";
  };
}
