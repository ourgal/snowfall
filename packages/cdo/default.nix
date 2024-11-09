{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.cdo) pname version src;

  cargoHash = "sha256-HPLgstI3QApfPKPUyPy5DIMhK6NXbbhjvmhac4KTpM4=";

  meta = with lib; {
    description = "Small command to run other commands in a given directory";
    homepage = "https://github.com/dotboris/cdo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cdo";
  };
}
