{
  lib,
  rustPlatform,
  _sources,
}:

rustPlatform.buildRustPackage rec {
  inherit (_sources.servicer) pname version src;

  cargoHash = "sha256-0FQiTuzI9S1GIqr2/aUOW2oNG3WOvUU8KXnR8WIadn4=";

  meta = with lib; {
    description = "A CLI to simplify service management on systemd";
    homepage = "https://github.com/servicer-labs/servicer";
    changelog = "https://github.com/servicer-labs/servicer/blob/${src.rev}/CHANGELOG.md";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "servicer";
  };
}
