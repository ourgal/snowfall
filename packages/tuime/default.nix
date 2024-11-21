{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.tuime
  // {
    inherit (_sources.tuime) pname version src;

    cargoHash = "sha256-0Y/fE1ydvVg/oOwbZ/49zUDD/84FYq8BQ3mfgbtTrSE=";

    meta = with lib; {
      description = "Tui clock written in rust";
      homepage = "https://github.com/nate-sys/tuime";
      license = licenses.gpl3Only;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "tuime";
    };
  }
)
