{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule {
  inherit (_sources.lab) pname version src;

  vendorHash = null;

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Lab helps you experiment with code without friction. Type `lab` with any extension and start coding - it handles files, organization, and cleanup automatically";
    homepage = "https://github.com/lugenx/lab";
    license = lib.licenses.unfree; # FIXME: nix-init did not find a license
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "lab";
  };
}
