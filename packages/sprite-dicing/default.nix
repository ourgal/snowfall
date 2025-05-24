{
  lib,
  rustPlatform,
  pkg-config,
  _sources',
}:
let
  source = _sources' ./.;
in
rustPlatform.buildRustPackage rec {
  inherit (source) pname version src;

  cargoLock = source.cargoLock."crates/Cargo.lock";

  sourceRoot = "${src.name}/crates";

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
