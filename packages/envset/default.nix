{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.envset
  // {
    meta = with lib; {
      description = "Set values in .env files the fun way";
      homepage = "https://github.com/schpet/envset";
      license = licenses.isc;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "envset";
    };
  }
)
