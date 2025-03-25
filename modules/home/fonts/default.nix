args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) font mkFontconfig;
      emoji = font.getName font.emoji;
    in
    {
      path = ./.;
      nixPkgs = font.nixPkgs;
      myPkgs = font.myPkgs;
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
                      string = [
                        font.cjk.sans.cn
                        font.en.sans
                      ] ++ emoji;
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
                      string = [
                        font.cjk.serif.cn
                        font.en.serif
                      ] ++ emoji;
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
                      string = [
                        font.mono.name
                        font.cjk.sans.cn
                      ] ++ emoji;
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
                        string = font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.sans.hk;
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
                        string = font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.serif.hk;
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
                        string = font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.sans.tw;
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
                        string = font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.serif.tw;
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
                        string = font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.sans.ja;
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
                        string = font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.serif.ja;
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
                        string = font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.sans.ko;
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
                        string = font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.cjk.serif.ko;
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
                        string = font.cjk.sans.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.en.sans;
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
                        string = font.cjk.serif.cn;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.en.serif;
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
