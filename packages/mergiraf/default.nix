{
  lib,
  rustPlatform,
  fetchFromGitea,
  git,
}:

rustPlatform.buildRustPackage {
  pname = "mergiraf";
  version = "unstable-2024-11-13";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "mergiraf";
    repo = "mergiraf";
    rev = "ca9cb0036f290f8ec1f51282f04015b7dd7a23fa";
    hash = "sha256-mLVBgwvriZ3vIlJFxb/T/6C49SLoAPN5n5kOC0hBUAc=";
  };

  nativeBuildInputs = [ git ];

  cargoHash = "sha256-gryijyXpufHLH/+W07HFfF0X9qfoTRAJmVOYCmR+l6Q=";

  meta = with lib; {
    description = "A syntax-aware git merge driver for a growing collection of programming languages and file formats";
    homepage = "https://codeberg.org/mergiraf/mergiraf";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "mergiraf";
  };
}
