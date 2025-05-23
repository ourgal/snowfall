{
  lib,
  stdenv,
  fetchurl,
  makeWrapper,
  fetchFromGitHub,
  dpkg,
  glib,
  gnutar,
  gtk3-x11,
  luajit,
  sdcv,
  SDL2,
  nix-update-script,
  openssl_1_1,
}:
let
  luajit_lua52 = luajit.override { enable52Compat = true; };
in
stdenv.mkDerivation rec {
  pname = "koreader";
  version = "2024.11";

  src =
    {
      aarch64-linux = fetchurl {
        url = "https://github.com/koreader/koreader/releases/download/v${version}/koreader-${version}-arm64.deb";
        hash = "sha256-uy+4+pNyz10xrGM0QF9q0y6UpQK1B9PGNqrcK6nENQY=";
      };
      armv7l-linux = fetchurl {
        url = "https://github.com/koreader/koreader/releases/download/v${version}/koreader-${version}-armhf.deb";
        hash = "sha256-lTc12qmoe0kGUhrStlGfDRw+cNJnX7F09/jKKc/1U9g=";
      };
      x86_64-linux = fetchurl {
        url = "https://github.com/koreader/koreader/releases/download/v${version}/koreader-${version}-amd64.deb";
        hash = "sha256-ibehFrOcJqhM+CMAcHDn3Xwy6CueB8kdnoYMMDe/2Js=";
      };
    }
    .${stdenv.hostPlatform.system} or (throw "Unsupported system: ${stdenv.hostPlatform.system}");

  src_repo = fetchFromGitHub {
    repo = "koreader";
    owner = "koreader";
    rev = "v${version}";
    fetchSubmodules = true;
    sha256 = "sha256-EI8UOQuwhJqcAp8QnLYhI0K+uV/7ZqxdHNk8mPkDWA0=";
  };

  sourceRoot = ".";
  nativeBuildInputs = [
    makeWrapper
    dpkg
  ];
  buildInputs = [
    glib
    gnutar
    gtk3-x11
    luajit_lua52
    sdcv
    SDL2
    openssl_1_1
  ];
  unpackCmd = "dpkg-deb -x ${src} .";

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    mkdir -p $out
    cp -R usr/* $out/
    ln -sf ${luajit_lua52}/bin/luajit $out/lib/koreader/luajit
    ln -sf ${sdcv}/bin/sdcv $out/lib/koreader/sdcv
    ln -sf ${gnutar}/bin/tar $out/lib/koreader/tar
    find ${src_repo}/resources/fonts -type d -execdir cp -r '{}' $out/lib/koreader/fonts \;
    find $out -xtype l -print -delete
    wrapProgram $out/bin/koreader --prefix LD_LIBRARY_PATH : ${
      lib.makeLibraryPath [
        gtk3-x11
        SDL2
        glib
        stdenv.cc.cc
        openssl_1_1
      ]
    }
  '';

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = with lib; {
    homepage = "https://github.com/koreader/koreader";
    changelog = "https://github.com/koreader/koreader/releases/tag/v${version}";
    description = "An ebook reader application supporting PDF, DjVu, EPUB, FB2 and many more formats, running on Cervantes, Kindle, Kobo, PocketBook and Android devices";
    mainProgram = "koreader";
    sourceProvenance = with sourceTypes; [ binaryNativeCode ];
    platforms = [
      "aarch64-linux"
      "armv7l-linux"
      "x86_64-linux"
    ];
    license = licenses.agpl3Only;
    maintainers = with maintainers; [
      contrun
      neonfuz
      liberodark
    ];
  };
}
