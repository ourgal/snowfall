{ ... }:
_final: prev: {
  lsp-ai = prev.lsp-ai.overrideAttrs (_oldAttrs: {
    postInstall = ''
      rm $out/bin/xtask
    '';
  });
}
