{
  lib,
  stdenv,
  python3,
  pkgs,
  namespace,
}:
let
  rich = python3.withPackages (ps: [ ps.rich ]);
  pname = "dlorg";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation {
  inherit (source) pname src version;

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D dlorg.py $out/bin/dlorg
    sed -i '1 i #!${rich}/bin/python3' $out/bin/dlorg
    mkdir -p $out/etc/dlorg
    cp folder_config.json $out/etc/dlorg
    substituteInPlace $out/bin/dlorg \
      --replace-fail folder_config.json $out/etc/dlorg/folder_config.json
    runHook postInstall
  '';

  meta = with lib; {
    description = "";
    homepage = "https://github.com/deepspeccode/dlorg";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dlorg";
    platforms = platforms.all;
  };
}