{
  lib,
  stdenvNoCC,
  gitUpdater,
  _sources,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  inherit (_sources.nrf-udev) pname version src;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r nrf-udev_*/lib $out

    runHook postInstall
  '';

  passthru.updateScript = gitUpdater { rev-prefix = "v"; };

  meta = with lib; {
    description = "Udev rules for nRF (Nordic Semiconductor) development kits";
    homepage = "https://github.com/NordicSemiconductor/nrf-udev";
    changelog = "https://github.com/NordicSemiconductor/nrf-udev/releases/tag/${finalAttrs.src.rev}";
    license = licenses.unfree;
    platforms = platforms.all;
    maintainers = with maintainers; [ h7x4 ];
  };
})
