{ ... }:
_final: prev: {
  watcher = prev.watcher.overrideAttrs (_oldAttrs: {
    postInstall = ''
      mv $out/bin/tw $out/bin/watcher
    '';
  });
}
