{
  lib,
  buildGoModule,
  _sources',
  android-tools,
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    vendorHash = "sha256-PNj5gkFj+ruxv1I4SezJxebDO2e1qGTYp3ZgekRLNt0=";

    ldflags = [
      "-s"
      "-w"
    ];

    postPatch = ''
      substituteInPlace adb/{server,device}.go \
        --replace 'exec.Command("adb"' 'exec.Command("${android-tools}/bin/adb"'
    '';

    doCheck = false;

    meta = {
      description = "F-Droid desktop client";
      homepage = "https://github.com/Hoverth/fdroidcl";
      license = lib.licenses.bsd3;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "fdroidcl";
    };
  }
)
