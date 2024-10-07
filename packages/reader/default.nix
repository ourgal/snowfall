{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "reader";
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

  vendorHash = "sha256-obYdifg3WrTyxgN/VtzgpL31ZOyPNtVT8UDQts0WodQ=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Reader is for your command line what the “readability” view is for modern browsers: A lightweight tool offering better readability of web pages on the CLI";
    homepage = "https://github.com/mrusme/reader";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "reader";
  };
}
