{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.rsv) pname version src;

  cargoLock = _sources.rsv.cargoLock."Cargo.lock";

  nativeBuildInputs = [ rustPlatform.bindgenHook ];

  doCheck = false;

  meta = with lib; {
    description = "A command line tool written in Rust to analyze small and large CSV, TXT, EXCEL files (e.g., >10G). Support data slicing, filtering, spliting, generating frequency table, etc";
    homepage = "https://github.com/ribbondz/rsv";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rsv";
  };
}
