{
  lib,
  buildGoModule,
  _sources',
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
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
)
