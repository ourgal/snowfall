{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) inputs;
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
        ".cargo/config.toml" = inputs.nix-std.lib.serde.toTOML {
          source = {
            crates-io = {
              replace-with = "rsproxy-sparse";
            };
            rsproxy = {
              registry = "https://rsproxy.cn/crates.io-index";
            };
            rsproxy-sparse = {
              registry = "sparse+https://rsproxy.cn/index/";
            };
          };
          registries = {
            rsproxy = {
              index = "https://rsproxy.cn/crates.io-index";
            };
          };
          net = {
            git-fetch-with-cli = true;
          };
        };
      };
      env = {
        # run rustup default stable
        RUSTUP_UPDATE_ROOT = "https://mirror.nju.edu.cn/rustup/rustup";
        RUSTUP_DIST_SERVER = "https://mirror.nju.edu.cn/rustu";
      };
    }
  )
)
