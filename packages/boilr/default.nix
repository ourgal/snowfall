{
  lib,
  stdenv,
  fetchzip,
  pkgs,
  namespace,
}:
let
  pname = "boilr";
  source = pkgs.${namespace}.sources.${pname};
in
stdenv.mkDerivation rec {
  inherit (source) pname version;

  src = fetchzip {
    url = "https://github.com/tmrts/boilr/releases/download/${version}/boilr-${version}-linux_amd64.tgz";
    hash = "sha256-HHqQnUXkaDOjWZ2AwZnndGKl/ZuJxzz5N2mVeL5KKPg=";
    stripRoot = false;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall
    install -m755 -D boilr $out/bin/boilr
    runHook postInstall
  '';

  meta = with lib; {
    description = "Zap: boilerplate template manager that generates files or directories from template repositories";
    homepage = "https://github.com/tmrts/boilr";
    license = licenses.asl20;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "boilr";
    platforms = platforms.all;
  };
}
