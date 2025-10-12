{ ... }:
_final: prev: {
  comma = prev.comma.overrideAttrs (_oldAttrs: {
    postInstall = _oldAttrs.postInstall + ''
      substituteInPlace \
        "$out/etc/fish/functions/comma-command-not-found.fish" \
        --replace-fail '$@' '$argv'
    '';
  });
}
