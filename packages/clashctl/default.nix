{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "clashctl";
  version = "0.3.3";

  src = fetchFromGitHub {
    owner = "George-Miao";
    repo = "clashctl";
    rev = version;
    hash = "sha256-7XVMtl6yFxT9fy205sZL8eJ711NXdmYIMFVBbF0RoPc=";
  };

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
