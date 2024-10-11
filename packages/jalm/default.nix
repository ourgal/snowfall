{
  lib,
  rustPlatform,
  pkgs,
  namespace,
}:
let
  pname = "jalm";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-hwUdn8pD3/VWnultlLMprpng84nN2u+ht7P5KVdbBE4=";

  meta = with lib; {
    description = "Generate progress bars from cron expressions";
    homepage = "https://github.com/neelkarma/jalm";
    license = licenses.unfree; # FIXME: nix-init did not found a license
    maintainers = with maintainers; [ zxc ];
    mainProgram = "jalm";
  };
}
