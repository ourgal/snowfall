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
        config
        ;
      inherit (lib.${namespace}) font mkFontconfig;
      inherit (builtins) head;
      notNixos = lib.optionals (builtins.elem host lib.${namespace}.settings.non-NixOS);
      sansList = font.getName (
        [
          font.en.sans
          font.cjk.sans.cn
        ]
        ++ font.emoji
      );
      sansFirst = head sansList;
      serifList = font.getName (
        [
          font.en.serif
          font.cjk.serif.cn
        ]
        ++ font.emoji
      );
      serifFirst = head serifList;
      monoList = font.getName (
        [
          font.en.mono
          font.cjk.mono.cn
        ]
        ++ font.emoji
      );
      monoFirst = head monoList;
      system-ui = {
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
      };
      defaultFont = family: fonts: {
        "@target" = "pattern";
        test = {
          "@name" = "family";
          string = family;
        };
        edit = {
          "@name" = "family";
          "@mode" = "prepend";
          "@binding" = "strong";
          string = fonts;
        };
      };
      replaceWhen = lang: old: new: {
        "@target" = "pattern";
        test = [
          {
            "@name" = "lang";
            string = lang;
          }
          {
            "@name" = "family";
            string = old;
          }
        ];
        edit = {
          "@name" = "family";
          "@binding" = "strong";
          string = font.getName new;
        };
      };
      langSets =
        defaultFont: replaceSet:
        lib.attrsets.foldlAttrs
          (
            acc: name: value:
            acc ++ [ (replaceWhen value defaultFont replaceSet."${name}") ]
          )
          [ ]
          {
            cn = "zh-CN";
            tw = "zh-TW";
            hk = "zh-HK";
            ja = "ja";
            ko = "ko";
          };
    in
    {
      nixPkgs = _: notNixos (font.allPkgs pkgs namespace);
      confs = {
        "fontconfig/fonts.conf" =
          let
            header = ''
              <?xml version="1.0"?>
              <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
            '';
            settings = {
              fontconfig = {
                include = [
                  {
                    "@ignore_missing" = "yes";
                    string = "${config.home.path}/etc/fonts/conf.d";
                  }
                  {
                    "@ignore_missing" = "yes";
                    string = "${config.home.path}/etc/fonts/fonts.conf";
                  }
                ];
                dir = [
                  "${config.home.path}/lib/X11/fonts"
                  "${config.home.path}/share/fonts"
                  "${config.home.profileDirectory}/lib/X11/fonts"
                  "${config.home.profileDirectory}/share/fonts"
                ];
                cachedir = "${config.home.path}/lib/fontconfig/cache";
                match = [
                  system-ui
                  (defaultFont "sans-serif" sansList)
                  (defaultFont "serif" serifList)
                  (defaultFont "monospace" monoList)
                ]
                ++ langSets monoFirst font.cjk.mono
                ++ langSets sansFirst font.cjk.sans
                ++ langSets serifFirst font.cjk.serif;
              };
            };
          in
          mkFontconfig header settings;
      };
      cacheFiles."hm-fonts" =
        let
          getHash =
            drv: builtins.elemAt (builtins.match "${builtins.storeDir}/([a-z0-9]{32})-.*.drv" drv.drvPath) 0;
        in
        {
          text = lib.strings.concatMapStringsSep "\n" getHash (font.allPkgs pkgs namespace);
          _onchange = ''
            echo "Caching fonts"
            $DRY_RUN_CMD ${lib.getExe' pkgs.fontconfig "fc-cache"} -f
          '';
        };
    }
  )
)
