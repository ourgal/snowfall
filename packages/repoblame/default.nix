{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage {
  pname = "repoblame";
  version = "unstable-2024-09-14";

  src = fetchFromGitHub {
    owner = "martinn";
    repo = "repoblame";
    rev = "c8468ed7393463d4f9e5a1451f96b3266fae72e1";
    hash = "sha256-K/iU45x6EOPPqNTog29bqz4BkN6MgedVl2LON6r+DBg=";
  };

  cargoHash = "sha256-1+24VYT6Ks/FsV7+bp4ZW8yvXwRpzVnRziD9U4yYo08=";

  meta = with lib; {
    description = "Aggregate git blame stats across any git repository. Find out top contributors by Lines of Code";
    homepage = "https://github.com/martinn/repoblame";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "repoblame";
  };
}
