{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:

let
  pname = "trzsz-go";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-AsrRHHBlzW5s/PtJSQ+hAgqUIYwDwoemQaerRV/QKX0=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "Trzsz-go is the go version of trzsz, makes all terminals that support local shell to support trzsz ( trz / tsz";
    homepage = "https://github.com/trzsz/trzsz-go";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "trzsz-go";
  };
}
