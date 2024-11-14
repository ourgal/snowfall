{
  lib,
  rustPlatform,
  pkg-config,
  _sources,
}:

rustPlatform.buildRustPackage rec {
  inherit (_sources.sprite-dicing) pname version src;

  sourceRoot = "${src.name}/crates";

  cargoHash = "sha256-CMvLApS/Rd82+AtlcHWi/TqJzGBCiSxXzYaMsYO0RyY=";

  nativeBuildInputs = [ pkg-config ];

  postInstall = ''
    mv $out/bin/{cli,dice}
    mv $out/lib/{libabi,sprite_dicing}.so
  '';

  doCheck = false;

  meta = with lib; {
    description = "Cross-engine tool for lossless compression of sprites with identical areas";
    homepage = "https://github.com/elringus/sprite-dicing";
    license = licenses.mit;
    maintainers = with maintainers; [ zxc ];
    mainProgram = "dice";
    platforms = platforms.all;
  };
}
