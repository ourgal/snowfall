{
  lib,
  rustPlatform,
  git,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.mergiraf) pname src version;

  cargoLock = _sources.mergiraf.cargoLock."Cargo.lock";

  nativeBuildInputs = [ git ];

  meta = with lib; {
    description = "A syntax-aware git merge driver for a growing collection of programming languages and file formats";
    homepage = "https://codeberg.org/mergiraf/mergiraf";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mergiraf";
  };
}
