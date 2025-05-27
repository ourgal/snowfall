{
  lib,
  buildGoModule,
  _sources',
  xorg,
  libGL,
  namespace,
}:
buildGoModule (
  lib.${namespace}.mkGoSource (_sources' ./.)
  // {
    excludedPackages = [ "htmx" ];

    postInstall = "rm $out/bin/test";

    doCheck = false;

    buildInputs = [
      xorg.libX11.dev # X11/Xlib.h
      xorg.libXrandr # X11/extensions/Xrandr.h
      libGL # GL/glx.h
      xorg.libXcursor # X11/Xcursor/Xcursor.h
      xorg.libXinerama # X11/extensions/Xinerama.h
      xorg.libXi # X11/extensions/XInput2.h
      xorg.libXxf86vm # Xxf86vm
    ];

    vendorHash = "sha256-Mlv0xTn1kDU3eqiyCH6s965tYSYfzbd6n/xViLPiC+0=";

    ldflags = [
      "-s"
      "-w"
    ];

    meta = {
      description = "Comic & Manga Reader in Linux，Windows，MacOS。简单跨平台的漫画阅读器。わかりやすい漫画リーダー";
      homepage = "https://github.com/yumenaka/comigo";
      license = lib.licenses.mit;
      maintainers = with lib.maintainers; [ zxc ];
      mainProgram = "comigo";
    };
  }
)
