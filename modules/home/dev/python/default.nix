args:
args.module (
  args
  // (
    let
      inherit (args) toTOML;
    in
    {
      path = ./.;
      pyPkgs = [
        # keep-sorted start
        "black"
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
                url = "https://mirrors.cernet.edu.cn/pypi/web/simple/";
              }
            ];
          };
        }
        {
          ".pip/pip.conf" = # toml
            ''
              [global]
              index-url = https://mirrors.cernet.edu.cn/pypi/web/simple/
              [install]
              trusted-host = mirrors.cernet.edu.cn
            '';
        }
      ];
      enable = "global";
    }
  )
)
