{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "clashctl";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-G0mAcB80D7/s9kwkNhJkGLkVYpXMwqpLq/T9gLuYj4E=";

  doCheck = false;

  meta = with lib; {
    description = "CLI for interacting with clash";
    homepage = "https://github.com/George-Miao/clashctl";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "clashctl";
  };
}
