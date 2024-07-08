{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "serpl";
  version = "0.1.26";

  src = fetchFromGitHub {
    owner = "yassinebridi";
    repo = "serpl";
    rev = version;
    hash = "sha256-ppF74VI0ceB4G/RLTa1phEy+tQ34r4hOMxqlK7YeLo0=";
  };

  cargoHash = "sha256-/TnuRRzeCPp8pqa/soGV0b3ZYp0cCbt3un6SjatSGp0=";

  meta = with lib; {
    description = "A simple terminal UI for search and replace, ala VS Code";
    homepage = "https://github.com/yassinebridi/serpl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "serpl";
  };
}
