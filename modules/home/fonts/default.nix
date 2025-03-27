args:
args.module (
  args
  // (
    let
      inherit (args)
        lib
        namespace
        host
        pkgs
        ;
      inherit (lib.${namespace}) font mkFontconfig;
      inherit (lib.${namespace}.settings) allHosts;
      notNixos = lib.optionals (!builtins.elem host allHosts);
    in
    {
      path = ./.;
      value.home.packages = notNixos (font.allPkgs pkgs pkgs.${namespace});
      confs = {
        "fontconfig/fonts.conf" =
          let
            header = ''
              <?xml version="1.0"?>
              <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
            '';
            settings = {
              fontconfig = {
                match = [
                  {
                    "@target" = "pattern";
                    test = {
                      "@name" = "family";
                      string = "system-ui";
                    };
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = "sans-serif";
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = {
                      "@name" = "family";
                      string = "sans-serif";
                    };
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.getName (
                        [
                          font.cjk.sans.cn
                          font.en.sans
                        ]
                        ++ font.emoji
                      );
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = {
                      "@name" = "family";
                      string = "serif";
                    };
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.getName (
                        [
                          font.cjk.serif.cn
                          font.en.serif
                        ]
                        ++ font.emoji
                      );
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = {
                      "@name" = "family";
                      string = "monospace";
                    };
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.getName (
                        [
                          font.en.mono
                          font.cjk.mono.cn
                        ]
                        ++ font.emoji
                      );
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-CN";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.en.mono;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.mono.cn;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-TW";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.en.mono;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.mono.tw;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-HK";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.en.mono;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.mono.hk;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ja";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.en.mono;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.mono.ja;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ko";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.en.mono;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.mono.ko;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-HK";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.sans.hk;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-HK";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.serif.hk;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-TW";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.sans.tw;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "zh-TW";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.serif.tw;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ja";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.sans.ja;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ja";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.serif.ja;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ko";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.sans.ko;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        string = "ko";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.getName font.cjk.serif.ko;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        "@compare" = "contains";
                        string = "en";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.getName font.en.sans;
                    };
                  }
                  {
                    "@target" = "pattern";
                    test = [
                      {
                        "@name" = "lang";
                        "@compare" = "contains";
                        string = "en";
                      }
                      {
                        "@name" = "family";
                        string = font.getName font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.getName font.en.serif;
                    };
                  }
                ];
              };
            };
          in
          mkFontconfig header settings;
      };
    }
  )
)
