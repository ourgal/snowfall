{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "sig";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-gZZ2aOsqVqGN3gCBZnBXzlFicMssNIEyRT688OuNMJc=";

  meta = with lib; {
    description = "Interactive grep (for streaming";
    homepage = "https://github.com/ynqa/sig";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sig";
  };
}
