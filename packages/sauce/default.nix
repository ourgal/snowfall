{
  lib,
  buildGoModule,
  pkgs,
  namespace,
}:
let
  pname = "sauce";
  source = pkgs.${namespace}.sources.${pname};
in
buildGoModule {
  inherit (source) pname src version;

  vendorHash = "sha256-E7fMnrMtOrPPkWwUZ30MvwSmAKxgSb4MpEcqP4zFEck=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = with lib; {
    description = "A novelty CLI tool for all your anime source needs";
    homepage = "https://github.com/cadecuddy/sauce";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "sauce";
  };
}