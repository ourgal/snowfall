{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = [
      # "ipython"
      "ptpython"
      "websockets"
    ];
    nixPkgs = [
      "rye"
      "pyright"
      "poetry"
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
        ".rye/config.toml" = ''
          [[sources]]
          name = "default"
          url = "https://mirrors.aliyun.com/pypi/simple/"
        '';
      }
      {
        ".pip/pip.conf" = ''
          [global]
          index-url = https://mirrors.aliyun.com/pypi/simple/
          [install]
          trusted-host = mirror.aliyun.com
        '';
      }
    ];
  }
)
