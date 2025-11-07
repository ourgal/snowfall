{
  lib,
  stdenv,
  fetchFromGitHub,
  meson,
  ninja,
  pkg-config,
  cmake,
  openssl,
  libusb1,
  libcap,
  libseccomp,
  glib,
  dbus,
  libfprint-tod,
  gusb,
  innoextract,
  fetchurl,
  findutils,
  autoPatchelfHook,
}:
let
  extractedDlls = stdenv.mkDerivation {
    name = "lenovo-driver-dlls";
    src = fetchurl {
      url = "https://download.lenovo.com/pccbbs/mobiles/r19fp02w.exe";
      sha256 = "sha256-CfBurJRksBhsGxyN7Xlppik3Lh14nPxsi9d3xydbaY8=";
      name = "driver-installer.exe";
    };

    nativeBuildInputs = [
      innoextract
      findutils
    ];

    unpackPhase = ''
      runHook preUnpack
      mkdir -p windrv
      innoextract -d windrv $src
      runHook postUnpack
    '';

    configurePhase = "";
    buildPhase = "";

    installPhase = ''
      runHook preInstall
      mkdir -p $out

      for dll in ${
        toString [
          "synaFpAdapter104.dll"
          "synaWudfBioUsb104.dll"
        ]
      }; do
        dllPath=$(find windrv -name "$dll" -print -quit)
        if [ -z "$dllPath" ]; then
          echo "ERROR: DLL $dll not found in extracted files"
          exit 1
        fi
        cp $dllPath $out/
      done

      runHook postInstall
    '';
  };

in

stdenv.mkDerivation {
  pname = "libfprint-2-tod1-synatudor";
  version = "2-tod1-synatudor-0.1.0";

  src = fetchFromGitHub {
    owner = "Popax21";
    repo = "synaTudor";
    rev = "31dfdb06107fd1c35c9f9ceae72617e98eccc43a";
    hash = "sha256-/Uh9O2NahVcFg+lk5DkodECOTIyZZwcPs7OKOepagoQ=";
  };

  postPatch = ''
    mkdir -p build/libtudor
    cp ${extractedDlls}/*.dll build/libtudor/
    substituteInPlace libtudor/meson.build \
      --replace-fail "input: ['download_driver.sh', 'installer.sha']," "" \
      --replace-fail "command: [find_program('bash'), '@INPUT0@', '@INPUT1@', '@PRIVATE_DIR@', '@OUTDIR@'] + driver_dll_names" "command: ['pwd']"
    substituteInPlace libfprint-tod/meson.build \
      --replace-fail "libfprint_tod_dep = dependency('libfprint-2-tod-1')" "libfprint_tod_dep = dependency('libfprint-2-tod-1')
                       libfprint_incdir = include_directories('${libfprint-tod}/include/libfprint-2')
                       gio_incdir = include_directories('${glib.dev}/include/gio-unix-2.0')" \
      --replace-fail "include_directories: [libtudor_inc, tudor_host_inc, tudor_host_launcher_inc]," "include_directories: [libtudor_inc, tudor_host_inc, tudor_host_launcher_inc, libfprint_incdir, gio_incdir],"
  '';

  nativeBuildInputs = [
    meson
    ninja
    pkg-config
    cmake
    autoPatchelfHook
  ];

  buildInputs = [
    openssl
    libusb1
    libcap
    libseccomp
    glib
    dbus
    libfprint-tod
    gusb
    innoextract
  ];

  installPhase = ''
    runHook preInstall

    install -Dm444 libfprint-tod/libtudor_tod.so -t "$out/lib/libfprint-2/tod-1/"

    runHook postInstall
  '';

  passthru.driverPath = "/lib/libfprint-2/tod-1";

  meta = {
    description = "";
    homepage = "https://github.com/Popax21/synaTudor";
    license = lib.licenses.lgpl21Only;
    maintainers = with lib.maintainers; [ zxc ];
    platforms = lib.platforms.all;
  };
}
