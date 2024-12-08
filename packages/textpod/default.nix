{
  lib,
  rustPlatform,
  pkg-config,
  oniguruma,
  pkgs,
  namespace,
}:

let
  pname = "textpod";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname src version;

  cargoHash = "sha256-QeYESQSo0o6HzpCY+STvO65l1UyykRxsfHBEZwPXlyg=";

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
