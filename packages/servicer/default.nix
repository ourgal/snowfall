{
  lib,
  rustPlatform,
  _sources,
  namespace,
}:
rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource _sources.servicer
  // {
    meta = with lib; {
      description = "A CLI to simplify service management on systemd";
      homepage = "https://github.com/servicer-labs/servicer";
      changelog = "https://github.com/servicer-labs/servicer/blob/${src.rev}/CHANGELOG.md";
      license = licenses.mit;
      maintainers = with maintainers; [ zxc ];
      mainProgram = "servicer";
    };
  }
)
