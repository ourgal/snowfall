{
  lib,
  buildGoModule,
  _sources,
}:

buildGoModule rec {
  inherit (_sources.dnspyre) pname version src;

  vendorHash = "sha256-ijUGSxPFHON5Gl348VhC3gv9gs7Z3muNIenfka3NHK4=";

  ldflags = [ "-X=github.com/tantalor93/dnspyre/v3/cmd.Version=${version}" ];

  meta = with lib; {
    description = "CLI tool for a high QPS DNS benchmark";
    homepage = "https://github.com/Tantalor93/dnspyre";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dnspyre";
  };
}
