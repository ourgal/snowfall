{
  lib,
  buildGoModule,
  _sources',
  libx11,
  libxrandr,
  libxcursor,
  libxinerama,
  libxxf86vm,
  libxi,
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
      libx11.dev # X11/Xlib.h
      libxrandr # X11/extensions/Xrandr.h
      libGL # GL/glx.h
      libxcursor # X11/Xcursor/Xcursor.h
      libxinerama # X11/extensions/Xinerama.h
      libxi # X11/extensions/XInput2.h
      libxxf86vm # Xxf86vm
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
