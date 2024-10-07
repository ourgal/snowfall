{
  lib,
  rustPlatform,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "simple-completion-language-server";
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

  cargoHash = "sha256-CXTP8JltZEwsa9v7uI1Nr0+fCVyt+Hai0crCUowTb6A=";

  checkFlags = [ "--skip=citations" ];

  meta = with lib; {
    description = "Language server to enable word completion and snippets for Helix editor";
    homepage = "https://github.com/estin/simple-completion-language-server";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "simple-completion-language-server";
  };
}
