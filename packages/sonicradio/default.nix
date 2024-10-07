{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "sonicradio";
  source = lib.${namespace}.sources.${pname};
in
buildGoModule {
  inherit pname;
  version = lib.substring 1 (-1) source.version;

  src = fetchFromGitHub {
    inherit (source.src)
      owner
      repo
      rev
      sha256
      ;
  };

  vendorHash = "sha256-m4QIGiuk8SbuwLI+Lp+NHgEZOvtwo7rbUiVmm7jwJ24=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "A TUI radio player making use of Radio Browser API and Bubbletea";
    homepage = "https://github.com/dancnb/sonicradio";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sonicradio";
  };
}
