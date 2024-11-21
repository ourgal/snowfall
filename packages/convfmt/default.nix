{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.convfmt
  // {
    meta = with lib; {
      description = "Cli tool which can convert different formats";
      homepage = "https://github.com/oriontvv/convfmt";
      changelog = "https://github.com/oriontvv/convfmt/blob/${src.rev}/CHANGELOG.md";
      license = licenses.asl20;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "convfmt";
    };
  }
)
