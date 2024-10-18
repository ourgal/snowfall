args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
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
        ".cargo/config.toml" = toTOML {
          source = {
            crates-io = {
              replace-with = "cernet-sparse";
            };
            rsproxy = {
              registry = "https://rsproxy.cn/crates.io-index";
            };
            rsproxy-sparse = {
              registry = "sparse+https://rsproxy.cn/index/";
            };
            cernet = {
              registry = "https://mirrors.cernet.edu.cn/crates.io-index.git";
            };
            cernet-sparse = {
              registry = "sparse+https://mirrors.cernet.edu.cn/crates.io-index/";
            };
          };
          registries = {
            rsproxy = {
              index = "https://rsproxy.cn/crates.io-index";
            };
            cernet = {
              index = "https://mirrors.cernet.edu.cn/crates.io-index.git";
            };
          };
          net = {
            git-fetch-with-cli = true;
          };
        };
      };
      env = {
        # run rustup default stable
        RUSTUP_UPDATE_ROOT = "https://mirrors.cernet.edu.cn/rustup/rustup";
        RUSTUP_DIST_SERVER = "https://mirrors.cernet.edu.cn/rustup";
      };
    }
  )
)
