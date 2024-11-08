{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.tabry-rs) pname version src;

  cargoHash = "sha256-aDqO8BCQKB4/Qtatw9q5zgKPqUfRYS4M5VIyAhkCVcg=";

  meta = with lib; {
    description = "Shell (tab) completion engine";
    homepage = "https://github.com/evanbattaglia/tabry-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tabry-rs";
  };
}
