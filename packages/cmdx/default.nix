{
  lib,
  buildGoModule,
  _sources',
}:

buildGoModule {
  inherit (_sources' ./.) pname version src;

  vendorHash = "sha256-njsZKv2++rRA1jtrAaYXcxRwkfpaRnUmiPYga9T90d4=";

  ldflags = [
    "-s"
    "-w"
  ];

  meta = {
    description = "Task runner. It provides useful help messages and supports interactive prompts and validation of arguments";
    homepage = "https://github.com/suzuki-shunsuke/cmdx";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ zxc ];
    mainProgram = "cmdx";
  };
}
