{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "simple-completion-language-server";
  version = "unstable-2024-06-04";

  src = fetchFromGitHub {
    owner = "estin";
    repo = "simple-completion-language-server";
    rev = "5d8f29b95b1e3491cc508ab4b6bc53f909c31d89";
    hash = "sha256-nqbth8dbrtPGkWghTzi4S7U7FcbX3v4gVb8E9Xfy2Tc=";
  };

  cargoHash = "sha256-drSeOp94hDFHgvN/jJLbJT51VMdBPPrDqPYNGjGnXZo=";

  meta = with lib; {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "simple-completion-language-server";
  };
}
