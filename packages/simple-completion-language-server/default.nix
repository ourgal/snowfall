{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "simple-completion-language-server";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-6klrz3qNmIHRKnA0pDAqdOK8f6sdTw5EbbO7tHwjxAc=";

  checkFlags = [ "--skip=citations" ];

  meta = with lib; {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "simple-completion-language-server";
  };
}
