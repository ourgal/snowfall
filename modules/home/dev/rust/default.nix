{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
    "cargo"
    "rustc"
    "rustycli"
    # keep-sorted end
  ];
  files = {
    ".cargo/config.toml" = {
      "source" = {
        "crates-io" = {
          "replace-with" = "mirror";
        };
        "mirror" = {
          "registry" = "sparse+https://mirrors.cernet.edu.cn/crates.io-index/";
        };
      };
    };
  };
  env = {
    # run rustup default stable
    RUSTUP_UPDATE_ROOT = "https://mirrors.cernet.edu.cn/rustup/rustup";
    RUSTUP_DIST_SERVER = "https://mirrors.cernet.edu.cn/rustup";
  };
}
