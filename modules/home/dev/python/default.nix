args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "tach";
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
      "pylint"
      "pypy"
      "pyright"
      "python-launcher"
      "rye"
      "uv"
      "zxpy"
      # keep-sorted end
    ];
    progs = {
      ruff = {
        settings = {
          line-length = 100;
          lint = {
            per-file-ignores = {
              "__init__.py" = [ "F401" ];
            };
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
        ".rye/config.toml" = {
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
