{ bat, pog, ... }:
pog.pog {
  name = "batwhich";
  version = "0.1.0";
  argumentCompletion = "executables";

  runtimeInputs = [ bat ];

  script = ''
    bat "$(which "$1")"
  '';
}
