{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.repoblame
  // {
    meta = with lib; {
      description = "Aggregate git blame stats across any git repository. Find out top contributors by Lines of Code";
      homepage = "https://github.com/martinn/repoblame";
      license = licenses.asl20;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "repoblame";
    };
  }
)
