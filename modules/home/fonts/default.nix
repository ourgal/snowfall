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
                      string = "Source Han Sans HC";
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
                      string = "Source Han Sans TC";
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
                      string = "Source Han Sans HW";
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
                      string = "Source Han Sans K";
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
                      string = font.enSans;
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
