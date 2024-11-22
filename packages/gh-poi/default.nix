{
  lib,
  buildGoModule,
  _sources,
}:
buildGoModule {
  inherit (_sources.gh-poi) pname version src;

  vendorHash = "sha256-D/YZLwwGJWCekq9mpfCECzJyJ/xSlg7fC6leJh+e8i0=";

  ldflags = [
    "-s"
    "-w"
  ];

  doCheck = false;

  meta = with lib; {
    description = "Safely clean up your local branches";
    homepage = "https://github.com/seachicken/gh-poi";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "gh-poi";
  };
}
