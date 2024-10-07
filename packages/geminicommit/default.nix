{
  lib,
  buildGoModule,
  fetchFromGitHub,
  namespace,
}:
let
  pname = "geminicommit";
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

  vendorHash = "sha256-N1c0b+eGaIvXJ4p3ovDypGRIn8wCwemFoNm9CvItz6E=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "A CLI that writes git commit messages for you with Google Gemini AI";
    homepage = "https://github.com/tfkhdyt/geminicommit";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "geminicommit";
  };
}
