args:
args.module (
  args
  // (
    let
      inherit (args)
        config
        namespace
        pkgs
        lib
        ;
      inherit (config.${namespace}.user) browser;
    in
    {
      myPkgs = "s";
      progs.fish.functions.sp = {
        body = ''
          s -b ${browser} -p $argv[1] $argv[2..-1]
          ${lib.getExe pkgs.wmctrl} -a ${browser}
        '';
        description = "alias of s -p";
      };
      confs = {
        "s/config" = ''
          provider: google
          customProviders [
            {
              name: books
              url: "https://search.books.com.tw/search/query/cat/all/sort/5/v/1/page/1/spell/3/ms2/ms2_1/key/%s"
              tags: [novel]
            }
            {
              name: bwtw
              url: "https://www.bookwalker.com.tw/search?w=%s&series_display=1"
              tags: [novel]
            }
            {
              name: twdict
              url: "https://dict.revised.moe.edu.tw/search.jsp?md=1&word=%s#searchL"
              tags: [dict]
            }
            {
              name: mangazip
              url: "https://manga-zip.info/search/%s"
              tags: [novel]
            }
            {
              name: azjp
              url: "https://www.amazon.co.jp/s?k=%s"
              tags: [novel]
            }
          ]
        '';
      };
    }
  )
)
