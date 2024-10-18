{
  lib,
  pkgs,
  namespace,
}:
let
  pname = "parinfer-rust";
  source = pkgs.${namespace}.sources.${pname};
in
pkgs.vimUtils.buildVimPlugin rec {
  inherit (source) pname version src;

  meta = with lib; {
    description = "A Rust port of parinfer";
    homepage = "https://github.com/eraserhd/parinfer-rust";
    changelog = "https://github.com/eraserhd/parinfer-rust/blob/${src.rev}/CHANGELOG.adoc";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
  };
}
