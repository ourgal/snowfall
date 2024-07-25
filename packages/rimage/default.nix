{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
}:

rustPlatform.buildRustPackage rec {
  pname = "rimage";
  version = "0.10.3";

  src = fetchFromGitHub {
    owner = "SalOne22";
    repo = "rimage";
    rev = "v${version}";
    hash = "sha256-GfxnZ9fuok4/6BGrCZHD+hslCaHYUv16/8jreK+9JEI=";
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
