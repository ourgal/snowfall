{
  lib,
  vimUtils,
  _sources,
}:
vimUtils.buildVimPlugin rec {
  inherit (_sources.parinfer-rust) pname version src;

  meta = with lib; {
    description = "A Rust port of parinfer";
    homepage = "https://github.com/eraserhd/parinfer-rust";
    changelog = "https://github.com/eraserhd/parinfer-rust/blob/${src.rev}/CHANGELOG.adoc";
    license = licenses.isc;
    maintainers = with maintainers; [ zxc ];
  };
}
