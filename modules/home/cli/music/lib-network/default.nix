args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib config;
      inherit (builtins) foldl' replaceStrings concatStringsSep;
      sanitizeString = str: replaceStrings [ " " "'" ] [ "_" "" ] str;
      mkFilename = artist: title: "${sanitizeString artist}-${sanitizeString title}.mp3";
      metadata = [
        {
          artist = "Outlaw (feat. Miss Mary)";
          title = "it's different";
          album = "NCS";
          url = "https://www.bilibili.com/video/BV1nx411m7Rd";
        }
        {
          artist = "山口リサ";
          title = "明日へと…";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1654y1n7UT";
        }
        {
          artist = "fripSide";
          title = "Sky";
          album = "2nd fragment of fripSide";
          url = "https://www.bilibili.com/video/BV1ts41187a6";
        }
        {
          artist = "Dream";
          title = "こんなにも";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV19t4y1H7SY";
        }
        {
          artist = "Flower";
          title = "Blue Sky Blue";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV13r4y1j7Fe";
        }
        {
          artist = "WITCH NUMBER 4";
          title = "SAKURA";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV19F411N7kF";
        }
        {
          artist = "Flower";
          title = "太陽と向日葵";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1HZ4y1Y7Fb";
        }
        {
          artist = "Ayumi Hamasaki";
          title = "My All";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV11Xphe7ESz";
        }
        {
          artist = "TWICE";
          title = "Wonderful Day";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV18m4y197DT";
        }
        {
          artist = "花たん";
          title = "オレンジ";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV14B4y1p75K";
        }
        {
          artist = "HIROKO_WISE";
          title = "I loved you";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1yS4y1n7EU";
        }
        {
          artist = "沢井美空";
          title = "卒業メモリーズ~サヨナラ、あなた。~";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1jU4y1D7iH";
        }
        {
          artist = "Lily_μ";
          title = "SPECIAL DAY";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1fo4y1v7dY";
        }
        {
          artist = "安田レイ";
          title = "アシンメトリー";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1544y1G7qQ";
        }
        {
          artist = "Himawari";
          title = "shake it!";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1GW411x7yB";
        }
        {
          artist = "Flower";
          title = "秋風のアンサー";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1ZY41177GT";
        }
        {
          artist = "Yuna Ito";
          title = "Pureyes";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV14x411B73a";
        }
        {
          artist = "Flower";
          title = "白雪姫";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1q5411u71A";
        }
        {
          artist = "Flower";
          title = "人魚姫";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1p54y1L7zb";
        }
        {
          artist = "Flower";
          title = "カラフル";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1Ro4y117ip";
        }
        {
          artist = "Flower";
          title = "恋におちたら";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1Jv411p78z";
        }
        {
          artist = "Flower";
          title = "BRIGHT";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1Qa411z7Hj";
        }
        {
          artist = "Flower";
          title = "他の誰かより悲しい恋をしただけ";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1dV41137vD";
        }
        {
          artist = "Flower";
          title = "七色キャンドル";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1dy42187wL";
        }
        {
          artist = "Flower";
          title = "Clover";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV14m411X7S6";
        }
        {
          artist = "Flower";
          title = "瞳の奥の銀河";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV12DXuY5EzV";
        }
        {
          artist = "花たん";
          title = "Ray of Light";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1rUWMe1EQn";
        }
        {
          artist = "西野カナ";
          title = "ONE WAY LOVE";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1LG4y1Q7Pt";
        }
        {
          artist = "西野カナ";
          title = "Love you, Miss you";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1b14y1n7yt";
        }
        {
          artist = "CHIHIRO";
          title = "永遠";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1jd4y1t7wN";
        }
        {
          artist = "3L";
          title = "破月";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1RK411X7bS";
        }
        {
          artist = "Airots";
          title = "桃幻浪漫";
          album = "桃幻浪漫 ～千の刃濤、桃花染の皇姫 花あかり～";
          url = "https://www.bilibili.com/video/BV14J411T783";
        }
        {
          artist = "Thelma Aoyama";
          title = "二人の約束の日";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1js411r7QH";
        }
        {
          artist = "日之内エミ";
          title = "卒業";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1PD421K74g";
        }
        {
          artist = "果山サキ";
          title = "さよなら、愛してた。";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1Ks411h7jp";
        }
        {
          artist = "Juliet";
          title = "もっともっとキミを教えてよ";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV17W411D7WX";
        }
        {
          artist = "Ayuse Kozue";
          title = "Cry for You";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1SW411x7fs";
        }
      ];
      filenames = foldl' (acc: elem: acc + " " + (mkFilename elem.artist elem.title)) "" metadata;
      targets = concatStringsSep "\n" (
        foldl' (
          acc: elem:
          acc
          ++ [
            ''
              ${mkFilename elem.artist elem.title}:
              	$(yt) ${elem.url} -o $(temp)
              	$(ffmpeg) -i $(temp) $(silenceremove) "$@"
              	rm $(temp)
              	$(mid3v2) --song "${elem.title}" --artist "${elem.artist}" --album "${elem.album}" "$@"
            ''
          ]
        ) [ ] metadata
      );
    in
    {
      files."Music/net/Makefile" = {
        text = ''
          yt := ${lib.getExe pkgs.yt-dlp} -t mp3
          ffmpeg := ${lib.getExe pkgs.ffmpeg}
          mid3v2 := ${lib.getExe' pkgs.python3Packages.mutagen "mid3v2"}
          temp := temp.mp3
          silenceremove := -af silenceremove=start_periods=1:start_duration=0:start_threshold=-50dB:start_silence=1,areverse,silenceremove=start_periods=1:start_duration=0:start_threshold=-50dB:start_silence=1,areverse

          .PHONY: all clean test
          all: ${filenames}

          ${targets}

          clean:
          	rm *.mp3
        '';
        _onchange = ''
          echo "Downloading music from network"
          $DRY_RUN_CMD ${lib.getExe pkgs.gnumake} -C ${config.home.homeDirectory}/Music/net
        '';
      };
    }
  )
)
