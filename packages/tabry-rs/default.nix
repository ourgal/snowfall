{
  lib,
  rustPlatform,
  _sources,
}:
rustPlatform.buildRustPackage {
  inherit (_sources.tabry-rs) pname version src;

  cargoHash = "sha256-a7kPWM5/wpz0CuIJw90SA8q4tTz6WKD8yBwcWz0RsMs=";

  meta = with lib; {
    description = "Shell (tab) completion engine";
    homepage = "https://github.com/evanbattaglia/tabry-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "tabry-rs";
  };
}
