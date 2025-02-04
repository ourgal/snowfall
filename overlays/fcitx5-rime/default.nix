{ channels, ... }:
_: prev: rec {
  librime =
    (prev.librime.overrideAttrs (_oldAttrs: {
      buildInputs = _oldAttrs.buildInputs ++ [ prev.lua ];
    })).override
      {
        plugins = with prev; [
          librime-lua
          librime-octagram
        ];
      };
  fcitx5-rime = prev.fcitx5-rime.override {
    inherit librime;
    rimeDataPkgs = channels.nixpkgs.dot.sbsrf-rime-data;
  };
}
