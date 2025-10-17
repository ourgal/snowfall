{
  lib,
  rustPlatform,
  pkg-config,
  libxkbcommon,
  wayland,
  xorg,
  fontconfig,
  libgcc,
  stdenv,
  autoPatchelfHook,
  libiconv,
  noto-fonts-color-emoji,
  _sources',
  namespace,
}:

rustPlatform.buildRustPackage (
  lib.${namespace}.mkRustSource (_sources' ./.)
  // rec {
    buildInputs = [
      fontconfig.dev
      libxkbcommon.dev
      wayland
      xorg.libxcb
      xorg.libX11
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXi
      libgcc
    ];

    nativeBuildInputs =
      lib.optionals stdenv.isLinux [
        pkg-config
        autoPatchelfHook
      ]
      ++ lib.optionals stdenv.buildPlatform.isDarwin [ libiconv ];
    runtimeDependencies = [
      noto-fonts-color-emoji
    ]
    ++ lib.optionals stdenv.isLinux [
      wayland
      libxkbcommon
    ];

    postFixup = lib.optionalString stdenv.isLinux ''
      patchelf --set-rpath "${lib.makeLibraryPath buildInputs}" $out/bin/simplemoji
    '';

    dontWrapQtApps = true;
    makeWrapperArgs = [
      "--prefix LD_LIBRARY_PATH : ${lib.makeLibraryPath buildInputs}"
      "--prefix PATH : ${lib.makeBinPath [ wayland ]}"
    ];

    meta = {
      description = "Fast Application for look your amazing emojis write in Rust";
      homepage = "https://github.com/SergioRibera/simplemoji";
      license = with lib.licenses; [
        asl20
        mit
      ];
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "simplemoji";
    };
  }
)
