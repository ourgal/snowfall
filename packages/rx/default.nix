{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-cPBx5+30G41aGRU4bjk70ZtRqU5bVYaK9ob/eyljp1g=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Regex eXplorer, allows you to test your regexes with live-reload";
    homepage = "https://github.com/f01c33/rx";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "rx";
  };
}
