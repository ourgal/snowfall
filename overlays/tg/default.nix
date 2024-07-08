{ channels, ... }:
final: prev: {
  tg = prev.tg.overrideAttrs (_oldAttrs: {
    patches = [
      # Fix sending messages
      # https://github.com/paul-nameless/tg/pull/306
      (prev.fetchpatch {
        url = "https://github.com/mindtheegab/tg/commit/13e2b266989d2d757a394b0fb8cb7fd6ccc2b70c.patch";
        hash = "sha256-Wja6xBOlPuACzhbT8Yl3F8qSh3Kd9G1lnr9VarbPrfM=";
      })
      ./temp.patch
    ];
  });
}
