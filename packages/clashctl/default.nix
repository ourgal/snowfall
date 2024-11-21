{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.clashctl
  // {
    doCheck = false;

    meta = with lib; {
      description = "CLI for interacting with clash";
      homepage = "https://github.com/George-Miao/clashctl";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "clashctl";
    };
  }
)
