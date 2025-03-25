args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) font mkFontconfig;
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
                        font.cnSans
                        font.enSans
                      ] ++ font.emoji;
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
                        font.cnSerif
                        font.enSerif
                      ] ++ font.emoji;
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
                        font.mono
                        font.cnSans
                      ] ++ font.emoji;
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
                        string = font.cnSans;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.hkSans;
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
                        string = font.cnSerif;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.hkSerif;
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
                        string = font.cnSans;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.twSans;
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
                        string = font.cnSerif;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.twSerif;
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
                        string = font.cnSans;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.jaSans;
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
                        string = font.cnSerif;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.jaSerif;
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
                        string = font.cnSans;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.koSans;
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
                        string = font.cnSerif;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@binding" = "strong";
                      string = font.koSerif;
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
                        string = font.cnSans;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.enSans;
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
                        string = font.cnSerif;
                      }
                    ];
                    edit = {
                      "@name" = "family";
                      "@mode" = "prepend";
                      "@binding" = "strong";
                      string = font.enSerif;
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
