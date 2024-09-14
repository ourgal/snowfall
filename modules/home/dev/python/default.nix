{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        config
        namespace
        lib
        mkOpt'
        cfgHome
        toTOML
        ;
      cfg = cfgHome config.${namespace} ./.;
    in
    {
      path = ./.;
      pyPkgs = [
        # keep-sorted start
        "ipython"
        "ptpython"
        # keep-sorted end
      ];
      nixPkgs = [
        # keep-sorted start
        "poetry"
        "pyright"
        "rye"
        "uv"
        # keep-sorted end
      ];
      progs = {
        ruff = {
          settings = {
            line-length = 100;
            per-file-ignores = {
              "__init__.py" = [ "F401" ];
            };
            lint = {
              select = [
                "E4"
                "E7"
                "E9"
                "F"
                "I"
              ];
              ignore = [ ];
            };
          };
        };
      };
      files = [
        {
          ".rye/config.toml" = toTOML {
            sources = [
              {
                name = "default";
                url = "https://mirrors.aliyun.com/pypi/simple/";
              }
            ];
          };
        }
        {
          ".pip/pip.conf" = # toml
            ''
              [global]
              index-url = https://mirrors.aliyun.com/pypi/simple/
              [install]
              trusted-host = mirror.aliyun.com
            '';
        }
      ];
      value = {
        home.packages = [
          (pkgs.python3.withPackages (
            ps:
            [
              ps.black
              ps.websockets
            ]
            ++ lib.${namespace}.with' ps cfg.pkgs
            ++ lib.optionals config.${namespace}.cli.download.aria2.enable (
              [ ps.aria2p ] ++ ps.aria2p.optional-dependencies.tui
            )
          ))
        ];
      };
      extraOpts = {
        pkgs = mkOpt' (lib.types.listOf lib.types.str) [ ];
      };
    }
  )
)
