{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "play";
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

  vendorHash = "sha256-9eP0rhsgpTttYrBG/BNk/ICtaM+zKNBz2H2cHuTSt30=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "A TUI playground to experiment with your favorite programs, such as grep, sed, awk, jq and yq";
    homepage = "https://github.com/paololazzari/play";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "play";
  };
}
