{
  lib,
  pkgs,
  fetchFromGitHub,
}:

pkgs.vimUtils.buildVimPlugin rec {
  pname = "parinfer-rust";
  version = "0.4.3";

  src = fetchFromGitHub {
    owner = "eraserhd";
    repo = "parinfer-rust";
    rev = "v${version}";
    hash = "sha256-7cnhR+11j/pxIMNp2hEuBroRyrMRoKdIFUfeA4uNRUI=";
  };

  meta = with lib; {
    description = "A Rust port of parinfer";
    homepage = "https://github.com/eraserhd/parinfer-rust";
    changelog = "https://github.com/eraserhd/parinfer-rust/blob/${src.rev}/CHANGELOG.adoc";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
  };
}
