{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = [
      # keep-sorted start
      "black"
      "ipython"
      "ptpython"
      "websockets"
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
        ".rye/config.toml" = # toml
          ''
            [[sources]]
            name = "default"
            url = "https://mirrors.aliyun.com/pypi/simple/"
          '';
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
  }
)
