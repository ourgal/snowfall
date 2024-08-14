{
  lib,
  rustPlatform,
  fetchFromGitHub,
}:

rustPlatform.buildRustPackage rec {
  pname = "rsv";
  version = "0.4.12";

  src = fetchFromGitHub {
    owner = "ribbondz";
    repo = "rsv";
    rev = "v${version}";
    hash = "sha256-muPW4kq1STsJ6j3KuqSQU5nQCd25LpqjbP97S2FjZ6E=";
  };

  cargoHash = "sha256-qieERSla3E3IL4/P2OvwI5NS9fuXEGAiDqof+sgj+eI=";

  nativeBuildInputs = [ rustPlatform.bindgenHook ];

  meta = with lib; {
    description = "A command line tool written in Rust to analyze small and large CSV, TXT, EXCEL files (e.g., >10G). Support data slicing, filtering, spliting, generating frequency table, etc";
    homepage = "https://github.com/ribbondz/rsv";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "rsv";
  };
}
