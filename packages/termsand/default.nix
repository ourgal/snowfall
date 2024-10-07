{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "termsand";
  source = lib.${namespace}.sources.${pname};
in
rustPlatform.buildRustPackage {
  inherit pname;
  version = "unstable-${source.date}";

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  cargoHash = "sha256-E7EjEw8AmxqjbLrKuoRnVhiFPPDKrKGJiS3lfE9Psdk=";

  meta = with lib; {
    description = "";
    homepage = "https://github.com/ourgal/termsand";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "termsand";
  };
}
