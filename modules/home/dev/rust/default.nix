{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "rustc"
      "cargo"
    ];
    files = {
      ".cargo/config.toml" = ''
        [source.crates-io]
        replace-with = 'rsproxy-sparse'
        [source.rsproxy]
        registry = "https://rsproxy.cn/crates.io-index"
        [source.rsproxy-sparse]
        registry = "sparse+https://rsproxy.cn/index/"
        [registries.rsproxy]
        index = "https://rsproxy.cn/crates.io-index"
        [net]
        git-fetch-with-cli = true
      '';
    };
    env = {
      # run rustup default stable
      RUSTUP_UPDATE_ROOT = "https://mirror.nju.edu.cn/rustup/rustup";
      RUSTUP_DIST_SERVER = "https://mirror.nju.edu.cn/rustu";
    };
  }
)
