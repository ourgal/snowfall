{ channels, ... }:
final: prev: rec {
  librime =
    (prev.librime.overrideAttrs (_oldAttrs: {
      buildInputs = _oldAttrs.buildInputs ++ [ prev.lua ];
    })).override
      { plugins = [ channels.nixpkgs.dot.librime-lua ]; };
  fcitx5-rime = prev.fcitx5-rime.override {
    librime = librime;
    rimeDataPkgs = channels.nixpkgs.dot.sbsrf-rime-data;
  };
}
