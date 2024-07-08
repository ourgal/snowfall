{ channels, lib, ... }:
final: prev: {
  ctpv = prev.ctpv.overrideAttrs (_oldAttrs: {
    preFixup = with channels.nixpkgs; ''
      wrapProgram $out/bin/ctpv \
        --prefix PATH ":" "${
          lib.makeBinPath [
            atool # for archive files
            bat
            chafa # for image files on Wayland
            delta # for diff files
            ffmpeg
            ffmpegthumbnailer
            fontforge
            glow # for markdown files
            imagemagick
            jq # for json files
            ueberzugpp # for image files on X11
          ]
        }";
    '';
  });
}
