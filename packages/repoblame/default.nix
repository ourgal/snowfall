{
  lib,
  rustPlatform,
  namespace,
  pkgs,
}:
let
  pname = "repoblame";
  source = pkgs.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit (source) pname version src;

  cargoHash = "sha256-/8DyiWX2s0Dx0OQJnaQPCym0jp66pQ1KnOwXTtlPjwk=";

  meta = with lib; {
    description = "Aggregate git blame stats across any git repository. Find out top contributors by Lines of Code";
    homepage = "https://github.com/martinn/repoblame";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "repoblame";
  };
}
