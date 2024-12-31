{ ... }:
_final: prev: {
  clerk = prev.clerk.overrideAttrs (_oldAttrs: {
    postFixup =
      let
        binPath = prev.lib.makeBinPath [
          prev.fzf
          prev.libnotify
          prev.mpc
          prev.rofi
          prev.tmux
          prev.util-linux
        ];
      in
      ''
        for f in $(find $out/bin -type f); do
          wrapProgram $f \
            --prefix PATH : "${binPath}" \
            --prefix PERL5LIB ':' "$PERL5LIB"
        done
      '';
  });
}
