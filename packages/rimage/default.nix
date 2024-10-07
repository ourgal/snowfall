{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  namespace,
}:
let
  pname = "rimage";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage rec {
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

  cargoHash = "sha256-OAMZOpxGlYfJkSRXhDXiZ3eYdDiXU1g7bEUNOJ6Zf/M=";

  nativeBuildInputs = [ pkg-config ];

  doCheck = false;

  meta = with lib; {
    description = "This is CLI tool inspired by squoosh";
    homepage = "https://github.com/SalOne22/rimage";
    changelog = "https://github.com/SalOne22/rimage/blob/${src.rev}/CHANGELOG.md";
    license = with licenses; [
      asl20
      mit
    ];
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rimage";
  };
}
