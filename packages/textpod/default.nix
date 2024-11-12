{
  lib,
  rustPlatform,
  pkg-config,
  oniguruma,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.textpod) pname src version;

  cargoLock = _sources.textpod.cargoLock."Cargo.lock";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ oniguruma ];

  env = {
    RUSTONIG_SYSTEM_LIBONIG = true;
  };

  meta = with lib; {
    description = "Extremely simple note-taking app inspired by \"One Big Text File";
    homepage = "https://github.com/freetonik/textpod";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "textpod";
  };
}
