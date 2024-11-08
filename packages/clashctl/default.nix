{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.clashctl) pname version src;

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
