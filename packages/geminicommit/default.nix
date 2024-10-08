{
  lib,
  buildGoModule,
  namespace,
  pkgs,
}:
let
  pname = "geminicommit";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

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
