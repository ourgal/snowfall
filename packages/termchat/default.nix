{
  lib,
  rustPlatform,
  stdenv,
  darwin,
  _sources',
  namespace,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // {
    nativeBuildInputs = [ rustPlatform.bindgenHook ];

    buildInputs = lib.optionals stdenv.isDarwin [
      darwin.apple_sdk.frameworks.CoreFoundation
      darwin.apple_sdk.frameworks.SystemConfiguration
    ];

    meta = {
      description = "Terminal chat through the LAN with video streaming and file transfer";
      homepage = "https://github.com/lemunozm/termchat";
      license = lib.licenses.asl20;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "termchat";
    };
  }
)
