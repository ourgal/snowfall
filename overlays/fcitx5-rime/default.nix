{ channels, ... }:
_: prev: {
  fcitx5-rime = prev.fcitx5-rime.override {
    rimeDataPkgs = [ channels.nixpkgs.dot.sbsrf-rime-data ];
  };
}
