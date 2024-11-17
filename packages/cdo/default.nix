{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage {
  inherit (_sources.cdo) pname version src;

  cargoHash = "sha256-PqDnXsYxdTs5+x53E+6KrJPbRVoE3oKTl1HIKWYnB9Y=";

  meta = with lib; {
    description = "Small command to run other commands in a given directory";
    homepage = "https://github.com/dotboris/cdo";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "cdo";
  };
}
