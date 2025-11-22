args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        lib
        config
        switch
        cfgHome
        namespace
        ;
      inherit (builtins) foldl' replaceStrings concatStringsSep;
      sanitizeString = str: replaceStrings [ " " "'" ":" ] [ "_" "" "_" ] str;
      mkFilename = artist: title: "${sanitizeString artist}-${sanitizeString title}.mp3";
      cfg = cfgHome config.${namespace} ./.;
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
        {
          artist = "ClariS";
          title = "ココロの引力";
          album = "irony";
          url = "https://music.163.com/#/song?id=705379";
        }
        {
          artist = "花鋏キョウ";
          title = "Behavior";
          album = "Myosøtis";
          url = "https://music.163.com/#/song?id=1447563289";
        }
        {
          artist = "花鋏キョウ";
          title = "paradøx";
          album = "Myosøtis";
          url = "https://music.163.com/#/song?id=1447562427";
        }
        {
          artist = "花たん";
          title = "Dear";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548279";
        }
        {
          artist = "mineko";
          title = "miscalc";
          album = "PARTICLE";
          url = "https://music.163.com/#/song?id=1395758737";
        }
        {
          artist = "96猫";
          title = "流れ星";
          album = "月と星の虚構空間";
          url = "https://music.163.com/#/song?id=25931854";
        }
        {
          artist = "BENI";
          title = "Our Sky";
          album = "Our Sky";
          url = "https://music.163.com/#/song?id=26544404";
        }
        {
          artist = "鈴木このみ";
          title = "My Days";
          album = "My Days";
          url = "https://music.163.com/#/song?id=521417493";
        }
        {
          artist = "ときのそら";
          title = "コトバカゼ";
          album = "Dreaming!";
          url = "https://music.163.com/#/song?id=1354616291";
        }
        {
          artist = "YuNi";
          title = "Winter Berry";
          album = "Winter Berry";
          url = "https://music.163.com/#/song?id=1335650210";
        }
        {
          artist = "森永真由美";
          title = "束縛アネモネーション";
          album = "束縛アネモネーション";
          url = "https://music.163.com/#/song?id=28814941";
        }
        {
          artist = "うさ";
          title = "Reflect";
          album = "デジウィ IMPACT";
          url = "https://music.163.com/#/song?id=34916709";
        }
        {
          artist = "西沢幸奏";
          title = "吹雪";
          album = "吹雪";
          url = "https://music.163.com/#/song?id=30621776";
        }
        {
          artist = "仲村芽衣子";
          title = "reverb";
          album = "DIVINE FORTUNE";
          url = "https://music.163.com/#/song?id=26388031";
        }
        {
          artist = "花たん";
          title = "エアーマンが倒せない";
          album = "最新热歌慢摇82";
          url = "https://music.163.com/#/song?id=29544924";
        }
        {
          artist = "光岡昌美";
          title = "ダメよ♡";
          album = "ダメよ";
          url = "https://music.163.com/#/song?id=611653";
        }
        {
          artist = "天宮みや";
          title = "果てなき風の軌跡さえ";
          album = "果てなき風の軌跡さえ";
          url = "https://music.163.com/#/song?id=412951928";
        }
        {
          artist = "桃梨";
          title = "tod und feuer";
          album = "HEART CHAIN";
          url = "https://music.163.com/#/song?id=4950627";
        }
        {
          artist = "瑶山百霊";
          title = "星夜万華鏡";
          album = "Lunatic Heavens";
          url = "https://music.163.com/#/song?id=26134301";
        }
        {
          artist = "井上純一";
          title = "それぞれの12ヶ月";
          album = "てさぐれ! 歌もの あんこーる";
          url = "https://music.163.com/#/song?id=31587061";
        }
        {
          artist = "yukina & みぃ";
          title = "雪琥珀 -snow amber- Remix";
          album = "Another World2";
          url = "https://music.163.com/#/song?id=27644670";
        }
        {
          artist = "sajou no hana";
          title = "メモセピア";
          album = "メモセピア";
          url = "https://music.163.com/#/song?id=1339922587";
        }
        {
          artist = "森永真由美";
          title = "零れずの願いゴト";
          album = "零れずの願いゴト";
          url = "https://music.163.com/#/song?id=528272202";
        }
        {
          artist = "鹿乃";
          title = "今をかける少女";
          album = "nowhere";
          url = "https://music.163.com/#/song?id=412327101";
        }
        {
          artist = "Nanaka";
          title = "今をかける少女";
          album = "Singing";
          url = "https://music.163.com/#/song?id=456312718";
        }
        {
          artist = "鹿乃";
          title = "缲り返し一粒 リンver";
          album = "暧昧ばんび~な";
          url = "https://music.163.com/#/song?id=22705493";
        }
        {
          artist = "DJ.Lars";
          title = "Masayume Chasing (Vocal Version) (DJ.Lars Trance Remix)";
          album = "Masayume Chasing(DJ.Lars Trance Remix)";
          url = "https://music.163.com/#/song?id=434070608";
        }
        {
          artist = "隣人 & t+pazolite & 高桥菜菜";
          title = "Missing Opus feat. cold kiss(Nana Takahashi) - t+pazolite Remix";
          album = "Double Key";
          url = "https://music.163.com/#/song?id=28576329";
        }
        {
          artist = "舞花";
          title = "New World";
          album = "World Trick";
          url = "https://music.163.com/#/song?id=33955442";
        }
        {
          artist = "仲村芽衣子";
          title = "Scarlet Faith";
          album = "Scarlet Faith";
          url = "https://music.163.com/#/song?id=28812025";
        }
        {
          artist = "森永真由美";
          title = "灼熱のユートピア";
          album = "灼熱のユートピア";
          url = "https://music.163.com/#/song?id=34509382";
        }
        {
          artist = "舞花";
          title = "crescent moon";
          album = "Rebirth Story Ⅲ";
          url = "https://music.163.com/#/song?id=413077069";
        }
        {
          artist = "榊原ゆい";
          title = "Miss.Brand-new day";
          album = "絶対★魔王ORIGINAL SOUND TRACK ~ボクの耳キュン音楽祭~";
          url = "https://music.163.com/#/song?id=723916";
        }
        {
          artist = "亜咲花";
          title = "SHINY DAYS";
          album = "SHINY DAYS";
          url = "https://music.163.com/#/song?id=530995169";
        }
        {
          artist = "鈴木みのり";
          title = "GIRAFFE BLUES ~Freyja Solo~";
          album = "絶対零度θノヴァティック/破滅の純情";
          url = "https://music.163.com/#/song?id=424264951";
        }
        {
          artist = "livetune & halca";
          title = "Resonator";
          album = "BEATLESS Special Soundtrack";
          url = "https://music.163.com/#/song?id=534064135";
        }
        {
          artist = "アイドルカレッジ";
          title = "トゥルーエンド プレイヤー";
          album = "トゥルーエンド プレイヤー";
          url = "https://music.163.com/#/song?id=29787857";
        }
        {
          artist = "ClariS";
          title = "PRIMALove";
          album = "PRIMALove";
          url = "https://music.163.com/#/song?id=531051596";
        }
        {
          artist = "南條愛乃";
          title = "空種";
          album = "穢翼のユースティア -Original CharacterSong Series- EUSTIA";
          url = "https://music.163.com/#/song?id=630884";
        }
        {
          artist = "山田タマル";
          title = "Scarborough Fair";
          album = "青い記憶";
          url = "https://music.163.com/#/song?id=489970551";
        }
        {
          artist = "さゆり";
          title = "天空の狂詩曲";
          album = "月光乱舞";
          url = "https://music.163.com/#/song?id=822495";
        }
        {
          artist = "Tamame";
          title = "Ebb and Flow (5 years after remix)";
          album = "Ebb and Flow (5 years after remix)";
          url = "https://music.163.com/#/song?id=29819851";
        }
        {
          artist = "ChouCho";
          title = "Sleeping Butterfly";
          album = "カワルミライ";
          url = "https://music.163.com/#/song?id=559908";
        }
        {
          artist = "TrySail";
          title = "High Free Spirits";
          album = "High Free Spirits";
          url = "https://music.163.com/#/song?id=412327886";
        }
        {
          artist = "3L";
          title = "Gods Garden";
          album = "FORLANE | REI";
          url = "https://music.163.com/#/song?id=22728023";
        }
        {
          artist = "marble";
          title = "水彩キャンディー";
          album = "水彩キャンディー";
          url = "https://music.163.com/#/song?id=781130";
        }
        {
          artist = "美郷あき";
          title = "Glitter";
          album = "月に寄りそう乙女の作法2 COMPLETE SOUNDTRACK";
          url = "https://music.163.com/#/song?id=32235534";
        }
        {
          artist = "森永真由美";
          title = "華鳥風月(with senya)";
          album = "華鳥風月";
          url = "https://music.163.com/#/song?id=869119";
        }
        {
          artist = "坂上なち";
          title = "last station feat. 坂上なち";
          album = "Dancing Dollz";
          url = "https://music.163.com/#/song?id=27624985";
        }
        {
          artist = "ayame";
          title = "Doll of Misery feat. ayame";
          album = "POP CULTURE 3";
          url = "https://music.163.com/#/song?id=32737683";
        }
        {
          artist = "savage genius";
          title = "Forever...";
          album = "Forever...";
          url = "https://music.163.com/#/song?id=646024";
        }
        {
          artist = "savage genius";
          title = "いつか溶ける涙";
          album = "想いを奏でて/いつか溶ける涙";
          url = "https://music.163.com/#/song?id=646047";
        }
        {
          artist = "EastNewSound";
          title = "demarcation line";
          album = "Blaze Out";
          url = "https://music.163.com/#/song?id=22785073";
        }
        {
          artist = "i.o.sound";
          title = "今日よりずっと、明日もきっと";
          album = "ドコドナボーカルコレクション";
          url = "https://music.163.com/#/song?id=28387662";
        }
        {
          artist = "LiSA";
          title = "Catch the Moment";
          album = "LiTTLE DEViL PARADE";
          url = "https://music.163.com/#/song?id=479938456";
        }
        {
          artist = "fripSide";
          title = "keep your promise";
          album = "keep your promise";
          url = "https://music.163.com/#/song?id=31191255";
        }
        {
          artist = "花たん";
          title = "ハジメテノオト";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548253";
        }
        {
          artist = "宮崎歩";
          title = "brave heart";
          album = "brave heart";
          url = "https://music.163.com/#/song?id=29816860";
        }
        {
          artist = "nayuta";
          title = "幽音絶花、缭乱ノ彩";
          album = "Alternative Outside 2010 Summer";
          url = "https://music.163.com/#/song?id=721891";
        }
        {
          artist = "はな";
          title = "櫻ノ詩";
          album = "サクラノ詩 ヴォーカルCD";
          url = "https://music.163.com/#/song?id=399367387";
        }
        {
          artist = "花たん";
          title = "Brand New Voice";
          album = "すきま桜とうその都会 初回特典 オリジナルサウンドトラック“Sakurano”";
          url = "https://music.163.com/#/song?id=4925707";
        }
        {
          artist = "777☆SISTERS";
          title = "H-A-J-I-M-A-R-I-U-T-A-!!";
          album = "H-A-J-I-M-A-L-B-U-M-!!";
          url = "https://music.163.com/#/song?id=32192774";
        }
        {
          artist = "下地紫野";
          title = "God Save The Girls";
          album = "God Save The Girls";
          url = "https://music.163.com/#/song?id=437292501";
        }
        {
          artist = "中村舞子";
          title = "Endless Tears";
          album = "Best Of Love";
          url = "https://music.163.com/#/song?id=22722555";
        }
        {
          artist = "花たん";
          title = "Knots Way";
          album = "ERiCa";
          url = "https://music.163.com/#/song?id=443070766";
        }
        {
          artist = "南條愛乃";
          title = "Asphodelus";
          album = "穢翼のユースティア -Original CharacterSong Series- EUSTIA";
          url = "https://music.163.com/#/song?id=630887";
        }
        {
          artist = "茶太";
          title = "詠奏妖華～明鏡止水～";
          album = "Auxiliary Brightness";
          url = "https://music.163.com/#/song?id=26127127";
        }
        {
          artist = "Machico";
          title = "Magical Happy Show !";
          album = "Magical Happy Show !";
          url = "https://music.163.com/#/song?id=623450";
        }
        {
          artist = "森永真由美";
          title = "夜桜に君を隠して";
          album = "夜桜に君を隠して";
          url = "https://music.163.com/#/song?id=28167582";
        }
        {
          artist = "美郷あき";
          title = "DESIRE";
          album = "月に寄りそう乙女の作法 COMPLETE SOUNDTRACK";
          url = "https://music.163.com/#/song?id=28568035";
        }
        {
          artist = "doriko";
          title = "Mermaid";
          album = "の、バラード祭り.";
          url = "https://music.163.com/#/song?id=860619";
        }
        {
          artist = "茶太";
          title = "Sound of Carnation";
          album = "Definite Energy";
          url = "https://music.163.com/#/song?id=22785149";
        }
        {
          artist = "めらみぽっぷ";
          title = "靴の音を、響かせて、その手を";
          album = "彩";
          url = "https://music.163.com/#/song?id=850502";
        }
        {
          artist = "なつみ";
          title = "萃梦想歌";
          album = "Vermillion Summer";
          url = "https://music.163.com/#/song?id=22730793";
        }
        {
          artist = "アフィリア・サーガ";
          title = "Embrace Blade";
          album = "Embrace Blade";
          url = "https://music.163.com/#/song?id=36841167";
        }
        {
          artist = "紫咲ほたる";
          title = "You're the love of my life...";
          album = "Perpetual Devotion";
          url = "https://music.163.com/#/song?id=28953266";
        }
        {
          artist = "めらみぽっぷ";
          title = "Zillion Lights";
          album = "Poptrick";
          url = "https://music.163.com/#/song?id=833011";
        }
        {
          artist = "市松椿";
          title = "Resolution";
          album = "Poptrick";
          url = "https://music.163.com/#/song?id=833016";
        }
        {
          artist = "ルルティア";
          title = "ロスト・バタフライ";
          album = "LOST BUTTERFLY";
          url = "https://music.163.com/#/song?id=640514";
        }
        {
          artist = "長尾ちえみ";
          title = "Kiss & Crazy (feat. 長尾ちえみ)";
          album = "864";
          url = "https://music.163.com/#/song?id=32405984";
        }
        {
          artist = "水瀬ましろ";
          title = "まっしろな雪";
          album = "東方幻奏響UROBOROS弐 ～fAIRYtAILoVERdRIVE～";
          url = "https://music.163.com/#/song?id=30841657";
        }
        {
          artist = "Stack";
          title = "カゲロウ";
          album = "NO SIGNAL";
          url = "https://music.163.com/#/song?id=27746534";
        }
        {
          artist = "闇音レンリ";
          title = "暧昧さ回避";
          album = "最新热歌慢摇114";
          url = "https://music.163.com/#/song?id=402070756";
        }
        {
          artist = "闇音レンリ";
          title = "Cynic";
          album = "Cynic";
          url = "https://music.163.com/#/song?id=419596411";
        }
        {
          artist = "CHIHIRO";
          title = "恋時雨";
          album = "恋時雨";
          url = "https://music.163.com/#/song?id=27853415";
        }
        {
          artist = "Goose house";
          title = "この指とまれ";
          album = "Goose house Phrase #05 この指とまれ";
          url = "https://music.163.com/#/song?id=26380612";
        }
        {
          artist = "水樹奈々";
          title = "SOUND OF DESTINY";
          album = "WHITE ALBUM ～綴られる冬の想い出～ ORIGINAL SOUNDTRACK";
          url = "https://music.163.com/#/song?id=32303029";
        }
        {
          artist = "霜月はるか";
          title = "羽ノ亡キ蝶";
          album = "羽ノ亡キ蝶";
          url = "https://music.163.com/#/song?id=691351";
        }
        {
          artist = "森永真由美";
          title = "アンロジカル";
          album = "レプリカの恋";
          url = "https://music.163.com/#/song?id=28581729";
        }
        {
          artist = "市松椿";
          title = "Rapture - Taishi Remix";
          album = "Poptrick";
          url = "https://music.163.com/#/song?id=833020";
        }
        {
          artist = "のみこ";
          title = "Alice Maestera feat. nomico";
          album = "Harmony";
          url = "https://music.163.com/#/song?id=22645181";
        }
        {
          artist = "幽閉サテライト";
          title = "ひねくれ少女(with senya)";
          album = "ミゼラブルの雫";
          url = "https://music.163.com/#/song?id=869355";
        }
        {
          artist = "坂本真綾";
          title = "Waiting for the rain";
          album = "FOLLOW ME UP";
          url = "https://music.163.com/#/song?id=35040542";
        }
        {
          artist = "I've";
          title = "Isolation";
          album = "つよきすFull Edition 初回版特典 オリジナルサウンドトラック 复刻版";
          url = "https://music.163.com/#/song?id=751380";
        }
        {
          artist = "森永真由美";
          title = "残響は鳴り止まず";
          album = "残響は鳴り止まず";
          url = "https://music.163.com/#/song?id=28953086";
        }
        {
          artist = "沙紗飛鳥";
          title = "散りゆく時-FINAL-";
          album = "記憶～MAIKAZE music works～";
          url = "https://music.163.com/#/song?id=784983";
        }
        {
          artist = "黒石ひとみ";
          title = "Continued Story";
          album = "Angel Feather Voice 2";
          url = "https://music.163.com/#/song?id=22805088";
        }
        {
          artist = "森永真由美";
          title = "FriendShip";
          album = "瞳に隠された想ヒ";
          url = "https://music.163.com/#/song?id=40729936";
        }
        {
          artist = "Lia";
          title = "Light colors";
          album = "智代アフター Original SoundTrack";
          url = "https://music.163.com/#/song?id=4977944";
        }
        {
          artist = "愛原圭織";
          title = "Road to Departure";
          album = "CLAUDIA";
          url = "https://music.163.com/#/song?id=830515";
        }
        {
          artist = "渕上舞 & 山村響";
          title = "Hello, hello";
          album = "BLUE";
          url = "https://music.163.com/#/song?id=41666870";
        }
        {
          artist = "nao";
          title = "entrance to you";
          album = "entrance to you";
          url = "https://music.163.com/#/song?id=629877";
        }
        {
          artist = "末柄里恵";
          title = "bitter sweet";
          album = "THE IDOLM@STER LIVE THE@TER HARMONY 04";
          url = "https://music.163.com/#/song?id=29418355";
        }
        {
          artist = "紫咲ほたる";
          title = "Urahara ff";
          album = "Mindless Act";
          url = "https://music.163.com/#/song?id=26449171";
        }
        {
          artist = "藤田麻衣子";
          title = "蛍";
          album = "瞬间";
          url = "https://music.163.com/#/song?id=571213";
        }
        {
          artist = "美里";
          title = "Necro Fantasia feat. 美里";
          album = "For Your Pieces";
          url = "https://music.163.com/#/song?id=687463";
        }
        {
          artist = "めらみぽっぷ";
          title = "シャングリラ";
          album = "パライソ";
          url = "https://music.163.com/#/song?id=26454931";
        }
        {
          artist = "幽閉サテライト";
          title = "ミゼラブルの雫(with senya)";
          album = "ミゼラブルの雫";
          url = "https://music.163.com/#/song?id=869351";
        }
        {
          artist = "彩音";
          title = "いつもこの場所で";
          album = "いつもこの場所で";
          url = "https://music.163.com/#/song?id=26259014";
        }
        {
          artist = "下川みくに & Nakagami & Ishikawa";
          title = "White Album";
          album = "Leaf Vocal Collection Volume 1";
          url = "https://music.163.com/#/song?id=27622999";
        }
        {
          artist = "つじあやの";
          title = "風になる";
          album = "猫の恩返し サウンドトラック";
          url = "https://music.163.com/#/song?id=482172";
        }
        {
          artist = "Rie fu";
          title = "Life Is Like A Boat";
          album = "Life Is Like A Boat";
          url = "https://music.163.com/#/song?id=640565";
        }
        {
          artist = "森永真由美";
          title = "色は匂へど散りぬるを(with senya)";
          album = "さぁ、こごう。";
          url = "https://music.163.com/#/song?id=28547521";
        }
        {
          artist = "Ceui";
          title = "今、歩き出す君へ。";
          album = "PCゲーム「いますぐお兄ちゃんに妹だっていいたい!」ボーカルアルバム";
          url = "https://music.163.com/#/song?id=26209670";
        }
        {
          artist = "幽閉サテライト";
          title = "大地に咲く旋律";
          album = "濡れた髪に触れられた时";
          url = "https://music.163.com/#/song?id=26107913";
        }
        {
          artist = "森永真由美";
          title = "溺愛エクリプス";
          album = "三千世界";
          url = "https://music.163.com/#/song?id=27571852";
        }
        {
          artist = "fripSide";
          title = "an evening calm (kai Re:product RMX)";
          album = "Re:product mixes ver.0.1";
          url = "https://music.163.com/#/song?id=22660898";
        }
        {
          artist = "左右田左";
          title = "永遠の花が降る";
          album = "秘密蜜封箋";
          url = "https://music.163.com/#/song?id=27610163";
        }
        {
          artist = "れるりり";
          title = "Mr.Music(歌姫Ver)";
          album = "Mr.Music";
          url = "https://music.163.com/#/song?id=26550694";
        }
        {
          artist = "彩音";
          title = "Lunatic Tears…";
          album = "Lunatic Tears…";
          url = "https://music.163.com/#/song?id=552075";
        }
        {
          artist = "3L";
          title = "桜华月想";
          album = "Overture l SUWA";
          url = "https://music.163.com/song?id=686361";
        }
        {
          artist = "綾倉盟";
          title = "melt in the sky";
          album = "Replica";
          url = "https://music.163.com/#/song?id=833438";
        }
        {
          artist = "幽閉サテライト";
          title = "アイリミテッド";
          album = "濡れた髪に触れられた时";
          url = "https://music.163.com/#/song?id=26107909";
        }
        {
          artist = "中村舞子";
          title = "言えない気持ち";
          album = "言えない気持ち";
          url = "https://music.163.com/#/song?id=409830542";
        }
        {
          artist = "紫咲ほたる";
          title = "Relate";
          album = "Definite Energy";
          url = "https://music.163.com/#/song?id=22785150";
        }
        {
          artist = "森永真由美";
          title = "コノ葉隠レ(with senya)";
          album = "コノ葉隠レ";
          url = "https://music.163.com/#/song?id=33020436";
        }
        {
          artist = "森永真由美";
          title = "泡沫、哀のまほろば";
          album = "幻-MABOROSHI- Singles Best Vol.2";
          url = "https://music.163.com/#/song?id=28547527";
        }
        {
          artist = "幽閉サテライト";
          title = "ヒトリシズカ";
          album = "幻想万華鏡～紅霧異変の章～ オリジナルサウンドトラック Vol.1";
          url = "https://music.163.com/#/song?id=32235274";
        }
        {
          artist = "幽閉サテライト";
          title = "夕立、君と隠れ処";
          album = "SOUND VOLTEX ULTIMATE TRACKS - 東方紅魔郷REMIX";
          url = "https://music.163.com/#/song?id=28866582";
        }
        {
          artist = "ゆいこんぬ";
          title = "ルートスフィア";
          album = "EXIT TUNES PRESENTS Cinderella";
          url = "https://music.163.com/#/song?id=28566460";
        }
        {
          artist = "日南結里 & 小澤亜李";
          title = "ミライプリズム";
          album = "ミライプリズム";
          url = "https://music.163.com/#/song?id=29932153";
        }
        {
          artist = "茶太";
          title = "Secret";
          album = "eclipse改";
          url = "https://music.163.com/#/song?id=640866";
        }
        {
          artist = "愛原圭織";
          title = "Place";
          album = "MA CHERIE";
          url = "https://music.163.com/#/song?id=29050075";
        }
        {
          artist = "花たん";
          title = "恋ノ蟲";
          album = "デジウィ LEGEND";
          url = "https://music.163.com/#/song?id=28524863";
        }
        {
          artist = "野村香菜子";
          title = "恋の音色ライン";
          album = "THE IDOLM@STER LIVE THE@TER HARMONY 09";
          url = "https://music.163.com/#/song?id=31165257";
        }
        {
          artist = "ナノ";
          title = "DREAMCATCHER";
          album = "DREAMCATCHER (アニメver.)";
          url = "https://music.163.com/#/song?id=438456473";
        }
        {
          artist = "沼倉愛美";
          title = "叫べ";
          album = "叫べ";
          url = "https://music.163.com/#/song?id=438466359";
        }
        {
          artist = "KOTOKO";
          title = "Face of Fact";
          album = "Starlight Symphony-KOTOKO LIVE 2006-IN YOKOHAMA ARENA";
          url = "https://music.163.com/#/song?id=590097";
        }
        {
          artist = "Halozy";
          title = "Paranoid Lost (feat. 美里)";
          album = "Tonic Triangle";
          url = "https://music.163.com/#/song?id=22808847";
        }
        {
          artist = "KOTOKO";
          title = "Face Of Fact-Resolution Ver.-";
          album = "Face Of Fact-Resolution Ver.-";
          url = "https://music.163.com/#/song?id=753805";
        }
        {
          artist = "渡辺麻友";
          title = "トライアングラー";
          album = "REQUEST";
          url = "https://music.163.com/#/song?id=31545006";
        }
        {
          artist = "KOTOKO";
          title = "jihad";
          album = "jihad";
          url = "https://music.163.com/#/song?id=589672";
        }
        {
          artist = "上原れな";
          title = "届かない恋";
          album = "l'espoir";
          url = "https://music.163.com/song?id=22809257";
        }
        {
          artist = "奥井雅美";
          title = "宝箱-TREASURE BOX-";
          album = "宝箱 -TREASURE BOX- / プラチナジェット";
          url = "https://music.163.com/#/song?id=30706884";
        }
        {
          artist = "Illusion Sonic";
          title = "夢の空、約束の場所";
          album = "SOUND VOLTEX ULTIMATE TRACKS - 東方紅魔郷REMIX";
          url = "https://music.163.com/#/song?id=28866602";
        }
        {
          artist = "NI+CORA";
          title = "オ・モ・イ アプローチ";
          album = "t7s Longing for summer";
          url = "https://music.163.com/#/song?id=30039364";
        }
        {
          artist = "NJK Record";
          title = "Endless night (梦消失 〜 Lost Dream)";
          album = "TOHO EURO FLASH Vol.2";
          url = "https://music.163.com/#/song?id=793740";
        }
        {
          artist = "発熱巫女~ず";
          title = "桜花之恋冢 ~ Flower of Life";
          album = "Re:Starlights&An Umbrella";
          url = "https://music.163.com/#/song?id=745206";
        }
        {
          artist = "佐藤康夫";
          title = "夜明";
          album = "陰陽師";
          url = "https://music.163.com/#/song?id=29047169";
        }
        {
          artist = "新谷良子";
          title = "ふわふわロンド";
          album = "ふわふわロンド";
          url = "https://music.163.com/#/song?id=646481";
        }
        {
          artist = "茶太";
          title = "夢笑顔";
          album = "茶太 Works Best II";
          url = "https://music.163.com/#/song?id=640295";
        }
        {
          artist = "森永真由美";
          title = "幾星霜の物語 ～The Story of Eternity～";
          album = "幾星霜の物語 ～The Story of Eternity～";
          url = "https://music.163.com/#/song?id=29769746";
        }
        {
          artist = "花たん";
          title = "Little Traveler";
          album = "Frozen Traveler";
          url = "https://music.163.com/#/song?id=29267629";
        }
        {
          artist = "坂上なち";
          title = "Ephemeral";
          album = "Frozen Traveler";
          url = "https://music.163.com/#/song?id=29267631";
        }
        {
          artist = "うさ";
          title = "【Diary】";
          album = "デジハロ PRIDE";
          url = "https://music.163.com/#/song?id=28178185";
        }
        {
          artist = "Halozy";
          title = "midnight cookie (feat. 夕月椿)";
          album = "864";
          url = "https://music.163.com/#/song?id=32405990";
        }
        {
          artist = "KOTOKO";
          title = "Fatally";
          album = "I've MANIA Tracks Vol.II";
          url = "https://music.163.com/#/song?id=22743257";
        }
        {
          artist = "新谷良子";
          title = "きらきらセレナーデ";
          album = "クロスワールド キャラクターコレクション(4)";
          url = "https://music.163.com/#/song?id=646465";
        }
        {
          artist = "川田まみ";
          title = "Lythrum";
          album = "犠母姉妹 SLG 特典サウンドトラック";
          url = "https://music.163.com/#/song?id=754693";
        }
        {
          artist = "南條愛乃";
          title = "メッセンジャー(FULL)";
          album = "朧小町予約特典サウンドトラック";
          url = "https://music.163.com/#/song?id=4929493";
        }
        {
          artist = "佳村はるか & 千菅春香 & 木村珠莉 & 大和田仁美 & 髙野麻美";
          title = "プラチナジェット";
          album = "宝箱 -TREASURE BOX- / プラチナジェット";
          url = "https://music.163.com/#/song?id=30706885";
        }
        {
          artist = "川田まみ";
          title = "Timeless time";
          album = "七つのふしぎの終わるとき VOCAL COLLECTION「Timeless time」";
          url = "https://music.163.com/#/song?id=592232";
        }
        {
          artist = "霜月はるか";
          title = "Re:Call";
          album = "できない私が、くり返す。 初回特典サウンドトラック「憧憬」";
          url = "https://music.163.com/#/song?id=29129677";
        }
        {
          artist = "西明日香 & 明坂聡美 & 大橋彩香 & 三上枝織 & 大久保瑠美 & 小松未可子 & 高森奈津美 & 上坂すみれ & 荻野可鈴";
          title = "色彩crossroad";
          album = "やっぱりStand Up!!!!!/色彩crossroad";
          url = "https://music.163.com/#/song?id=32235723";
        }
        {
          artist = "明坂聡美 & 大橋彩香 & 西明日香 & 荻野可鈴";
          title = "12ヶ月";
          album = "てさぐれ! 歌もの";
          url = "https://music.163.com/#/song?id=29011487";
        }
        {
          artist = "上田麗奈 & 田中美海 & 奥野香耶 & 大坪由佳 & 沼倉愛美";
          title = "花雪 チーム ハナヤマタ ver.";
          album = "ハナヤマタ 第6巻 特典CD";
          url = "https://music.163.com/#/song?id=31381033";
        }
        {
          artist = "牧野由依";
          title = "アムリタ";
          album = "天球の音楽";
          url = "https://music.163.com/#/song?id=610128";
        }
        {
          artist = "詩月カオリ";
          title = "A STARRY NIGHT 〜僕らをつなぐ光〜";
          album = "A STARRY NIGHT 〜僕らをつなぐ光〜";
          url = "https://music.163.com/#/song?id=34072026";
        }
        {
          artist = "詩月カオリ";
          title = "Hold on me ~恋の魔法~";
          album = "ラブライド イヴ ~love-bride eve~ 特典OST";
          url = "https://music.163.com/#/song?id=666138";
        }
        {
          artist = "mican*";
          title = "Spring Comes Along";
          album = "Double Counterpoint";
          url = "https://music.163.com/#/song?id=687111";
        }
        {
          artist = "暁Records";
          title = "描いた夏をもう一度";
          album = "ENDLESS FANTASY";
          url = "https://music.163.com/#/song?id=692420";
        }
        {
          artist = "nao";
          title = "colorless fate -ver. Luna 2011-";
          album = "fripSide PC game compilation vol. 1";
          url = "https://music.163.com/#/song?id=22660771";
        }
        {
          artist = "BENI";
          title = "ユラユラ";
          album = "ユラユラ／ギミギミ";
          url = "https://music.163.com/#/song?id=561190";
        }
        {
          artist = "Dreamy crown";
          title = "eternal promise";
          album = "eternal promise、終わりなき夏 永遠なる音律";
          url = "https://music.163.com/#/song?id=33761102";
        }
        {
          artist = "Halozy";
          title = "まっしろな雪 (feat. 水瀬ましろ)";
          album = "Bayside Beat";
          url = "https://music.163.com/#/song?id=40729947";
        }
        {
          artist = "スフィア";
          title = "明日への帰り道";
          album = "夏色キセキ Complete Songs ～あの夏のカケラ～";
          url = "https://music.163.com/#/song?id=29966711";
        }
        {
          artist = "fripSide";
          title = "miracle luminous";
          album = "fripSide PC game compilation vol. 1";
          url = "https://music.163.com/#/song?id=22660764";
        }
        {
          artist = "森永真由美";
          title = "アマノジャック";
          album = "残響は鳴り止まず";
          url = "https://music.163.com/#/song?id=28953087";
        }
        {
          artist = "明坂聡美 & 大久保瑠美";
          title = "青と黄色のあまのじゃく";
          album = "てさプル! 歌もの";
          url = "https://music.163.com/#/song?id=32235695";
        }
        {
          artist = "森永真由美";
          title = "炸裂アイロニー";
          album = "炸裂アイロニー";
          url = "https://music.163.com/#/song?id=29528357";
        }
        {
          artist = "森永真由美";
          title = "手のひらピアニッシモ";
          album = "手のひらピアニッシモ";
          url = "https://music.163.com/#/song?id=22780426";
        }
        {
          artist = "茶太";
          title = "Important Lie feat. 茶太";
          album = "Radical Destruction";
          url = "https://music.163.com/#/song?id=29247552";
        }
        {
          artist = "花たん";
          title = "RED Signal";
          album = "Colorful✿Flower";
          url = "https://music.163.com/#/song?id=22782491";
        }
        {
          artist = "仲村芽衣子";
          title = "Fixed.";
          album = "DIVINE FORTUNE";
          url = "https://music.163.com/#/song?id=26388028";
        }
        {
          artist = "森永真由美";
          title = "ヒトリシズカ(with senya)";
          album = "アノ華咲クヤ";
          url = "https://music.163.com/#/song?id=26457750";
        }
        {
          artist = "CHIHIRO";
          title = "ずるいよ…";
          album = "NAMIDA CARATS";
          url = "https://music.163.com/#/song?id=31352739";
        }
        {
          artist = "野宮あゆみ";
          title = "Sleeping Beauty";
          album = "COLORS";
          url = "https://music.163.com/#/song?id=22728089";
        }
        {
          artist = "森永真由美";
          title = "指先チョコレイト(with senya)";
          album = "アノ華咲クヤ";
          url = "https://music.163.com/#/song?id=26457751";
        }
        {
          artist = "みぃ";
          title = "Samsara（輪迴）";
          album = "AQ -永久-";
          url = "https://music.163.com/#/song?id=737966";
        }
        {
          artist = "TЁЯRA";
          title = "華爛漫 -Flowers-";
          album = "ЁVOLUTIФN";
          url = "https://music.163.com/#/song?id=22740182";
        }
        {
          artist = "清水達也";
          title = "蛍火 feat.月子";
          album = "FAR EAST OF EAST";
          url = "https://music.163.com/#/song?id=532922";
        }
        {
          artist = "鹿乃";
          title = "decide";
          album = "グッドハロー";
          url = "https://music.163.com/#/song?id=29848622";
        }
        {
          artist = "ねじ式";
          title = "紫陽花の夜";
          album = "Hydrangean Diva";
          url = "https://music.163.com/#/song?id=31341428";
        }
        {
          artist = "森永真由美";
          title = "シンデレラアバター";
          album = "シンデレラアバター!";
          url = "https://music.163.com/#/song?id=869220";
        }
        {
          artist = "森永真由美";
          title = "名残鸟";
          album = "シンデレラアバター!";
          url = "https://music.163.com/#/song?id=869224";
        }
        {
          artist = "森永真由美";
          title = "幽閉サテライトメドレーType：Iceon";
          album = "千華繚乱";
          url = "https://music.163.com/#/song?id=22780378";
        }
        {
          artist = "nao";
          title = "scarlet leap";
          album = "entrance to you";
          url = "https://music.163.com/#/song?id=629880";
        }
        {
          artist = "花たん";
          title = "サリシノハラ";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548260";
        }
        {
          artist = "山本美禰子";
          title = "雪のエルフィンリー ～Never ending love song～";
          album = "ASTRAL ARIA";
          url = "https://music.163.com/#/song?id=28850849";
        }
        {
          artist = "茶太";
          title = "雪の羽 時の風";
          album = "G線上の魔王 オリジナルサウンドコレクション";
          url = "https://music.163.com/#/song?id=26450054";
        }
        {
          artist = "Chris Medina";
          title = "What Are Words";
          album = "What Are Words";
          url = "https://music.163.com/#/song?id=1210496";
        }
        {
          artist = "Chen-U";
          title = "Libertus";
          album = "BOUQUET -Grand Finale-";
          url = "https://music.163.com/#/song?id=27580521";
        }
        {
          artist = "Reol";
          title = "Echo";
          album = "No title-";
          url = "https://music.163.com/#/song?id=28941714";
        }
        {
          artist = "森永真由美";
          title = "三千世界";
          album = "三千世界";
          url = "https://music.163.com/#/song?id=27571849";
        }
        {
          artist = "坂上なち";
          title = "サクラ・ホライズン feat.nachi (BEATLESS)";
          album = "POP CULTURE 3";
          url = "https://music.163.com/#/song?id=32737684";
        }
        {
          artist = "DiGiTAL WiNG";
          title = "Abracadabra";
          album = "HANA TOHOBEST";
          url = "https://music.163.com/#/song?id=28996103";
        }
        {
          artist = "森永真由美";
          title = "深読みレゾナンス";
          album = "レプリカの恋";
          url = "https://music.163.com/#/song?id=28581726";
        }
        {
          artist = "Rena";
          title = "穢れなき薔薇十字";
          album = "瑠璃色のローゼンクロイツ";
          url = "https://music.163.com/#/song?id=34248930";
        }
        {
          artist = "森永真由美";
          title = "小悪魔りんご";
          album = "手のひらピアニッシモ";
          url = "https://music.163.com/#/song?id=22780427";
        }
        {
          artist = "EastNewSound";
          title = "Steady night";
          album = "Dione Aggregation";
          url = "https://music.163.com/#/song?id=22785109";
        }
        {
          artist = "森永真由美";
          title = "零れ桜";
          album = "色は匂へど 散りぬるを";
          url = "https://music.163.com/#/song?id=869457";
        }
        {
          artist = "鹿乃";
          title = "paranoia";
          album = "或る街の白昼夢";
          url = "https://music.163.com/#/song?id=28181958";
        }
        {
          artist = "幽閉サテライト";
          title = "濡れた髪に触れられた時";
          album = "濡れた髪に触れられた时";
          url = "https://music.163.com/#/song?id=26107908";
        }
        {
          artist = "伊藤かな恵";
          title = "Happy Sunshine";
          album = "Happy Sunshine";
          url = "https://music.163.com/#/song?id=569038";
        }
        {
          artist = "vaguedge";
          title = "次発 ワタシ37号";
          album = "東方夢叶幻想日記";
          url = "https://music.163.com/#/song?id=860203";
        }
        {
          artist = "3L";
          title = "マクロフィラパラソル";
          album = "東方夢叶幻想日記";
          url = "https://music.163.com/#/song?id=744608";
        }
        {
          artist = "3L";
          title = "破月";
          album = "RADIATA";
          url = "https://music.163.com/#/song?id=22728057";
        }
        {
          artist = "日之内エミ";
          title = "卒业 -Congratulations- feat. Lotus Juice";
          album = "VOICE";
          url = "https://music.163.com/#/song?id=22821586";
        }
        {
          artist = "めらみぽっぷ";
          title = "竹ノ花";
          album = "薦";
          url = "https://music.163.com/#/song?id=28234319";
        }
        {
          artist = "やなぎなぎ";
          title = "Fall in the Dark";
          album = "マジコカタストロフィ - Digital Edition";
          url = "https://music.163.com/#/song?id=26107975";
        }
        {
          artist = "Irony & ℃iel";
          title = "藍 Second Love♥ふたりの唇";
          album = "虹色キャンバス";
          url = "https://music.163.com/#/song?id=30569527";
        }
        {
          artist = "K2 SOUND";
          title = "fairy stage";
          album = "天津星-Amatsu Hoshi";
          url = "https://music.163.com/#/song?id=766287";
        }
        {
          artist = "聆玖";
          title = "孟姜女";
          album = "孟姜女";
          url = "https://music.163.com/#/song?id=32958397";
        }
        {
          artist = "荒木毬菜";
          title = "春夏秋冬";
          album = "爱情转移日文版";
          url = "https://music.163.com/#/song?id=34187525";
        }
        {
          artist = "茶太";
          title = "変わり行く世界のために";
          album = "Dragon Valley - Misterio";
          url = "https://music.163.com/#/song?id=698168";
        }
        {
          artist = "森永真由美";
          title = "カフカなる群青へ";
          album = "纏-MATOI- Singles Best Vol.1";
          url = "https://music.163.com/#/song?id=28547518";
        }
        {
          artist = "ENE";
          title = "パズル";
          album = "voices in a bottle ～海を越え届いた歌声～";
          url = "https://music.163.com/#/song?id=857606";
        }
        {
          artist = "坂上なち";
          title = "Against, Perfect Cherry Blossom.";
          album = "Double Counterpoint";
          url = "https://music.163.com/#/song?id=687077";
        }
        {
          artist = "ONE OK ROCK";
          title = "Deeper Deeper";
          album = "人生×僕=";
          url = "https://music.163.com/#/song?id=27090435";
        }
        {
          artist = "森永真由美";
          title = "孤独月";
          album = "色は匂へど 散りぬるを";
          url = "https://music.163.com/#/song?id=869461";
        }
        {
          artist = "鹿乃";
          title = "Stella-rium";
          album = "Stella-rium";
          url = "https://music.163.com/#/song?id=32098832";
        }
        {
          artist = "森英治";
          title = "百鬼夜行抄";
          album = "〜the most relaxing〜feel presents New ASIA III";
          url = "https://music.163.com/#/song?id=4904996";
        }
        {
          artist = "松本晃彦";
          title = "Sakae In Action";
          album = "Summer Wars (Original Motion Picture Soundtrack)";
          url = "https://music.163.com/#/song?id=22710767";
        }
        {
          artist = "MANYO";
          title = "Lilac";
          album = "殻ノ少女 オリジナルサウンドトラック「Azure」";
          url = "https://music.163.com/#/song?id=28466087";
        }
        {
          artist = "折戸伸治";
          title = "風を待った日";
          album = "Kanon Original SoundTrack";
          url = "https://music.163.com/#/song?id=26134235";
        }
        {
          artist = "Sensitive Heart";
          title = "予感";
          album = "二胡陽炎 ～ 千秋恋歌";
          url = "https://music.163.com/#/song?id=836406";
        }
        {
          artist = "M.Graveyard";
          title = "you";
          album = "Thanks You";
          url = "https://music.163.com/#/song?id=786262";
        }
        {
          artist = "ANANT-GARDE EYES";
          title = "theme of SSS";
          album = "Angel Beats! Original SoundTrack";
          url = "https://music.163.com/#/song?id=471799";
        }
        {
          artist = "オムニバス";
          title = "Yotsuba no Clover";
          album = "Honey and Clover Soundtrack";
          url = "https://music.163.com/#/song?id=26133554";
        }
        {
          artist = "久石譲";
          title = "東から来た少年";
          album = "もののけ姫 サウンドトラック";
          url = "https://music.163.com/#/song?id=444761";
        }
        {
          artist = "ANANT-GARDE EYES";
          title = "unjust life";
          album = "Angel Beats! Original SoundTrack";
          url = "https://music.163.com/#/song?id=471942";
        }
        {
          artist = "井上昌己";
          title = "纯心";
          album = "“怪盗セイント・テール”BEST OF BEST";
          url = "https://music.163.com/#/song?id=474485";
        }
        {
          artist = "森永真由美";
          title = "月に叢雲華に風";
          album = "月に叢雲華に風";
          url = "https://music.163.com/#/song?id=869190";
        }
        {
          artist = "森永真由美";
          title = "Opposite World";
          album = "小悪魔りんご";
          url = "https://music.163.com/#/song?id=869438";
        }
        {
          artist = "美里";
          title = "Rondo of fantasy";
          album = "ソラとトキと二色のチョウ";
          url = "https://music.163.com/#/song?id=830958";
        }
        {
          artist = "ケーキ姫☆優海 & JUMA";
          title = "永夜のパレード";
          album = "幻想遊園郷 ～Fantastic Park～";
          url = "https://music.163.com/#/song?id=692193";
        }
        {
          artist = "花たん";
          title = "会いたい";
          album = "Colorful✿Flower";
          url = "https://music.163.com/#/song?id=22782484";
        }
        {
          artist = "BoA";
          title = "Only One (Japanese Ver.)";
          album = "Only One(Japanese Ver.)";
          url = "https://music.163.com/#/song?id=26343056";
        }
        {
          artist = "花たん";
          title = "ねこみみスイッチ";
          album = "Chers petits chats～親愛なる愛猫たちへ～";
          url = "https://music.163.com/#/song?id=29897804";
        }
        {
          artist = "花たん";
          title = "オレンジ";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548280";
        }
        {
          artist = "花たん";
          title = "ロミオとシンデレラ";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548282";
        }
        {
          artist = "花たん";
          title = "歌に形はないけれど";
          album = "Flower";
          url = "https://music.163.com/#/song?id=27548281";
        }
        {
          artist = "我々楽";
          title = "東山花灯路";
          album = "Dulcet Series Winter Special Collection - Fantastic Winter Journey";
          url = "https://music.163.com/#/song?id=28302615";
        }
        {
          artist = "神乃木製作所";
          title = "三年幻想郷";
          album = "三年幻想郷";
          url = "https://music.163.com/#/song?id=767452";
        }
        {
          artist = "Otokaze";
          title = "夏恋";
          album = "夏恋";
          url = "https://music.163.com/#/song?id=493911";
        }
        {
          artist = "市松椿";
          title = "童祭 ~ Innocent Treasures";
          album = "palette ~人々が爱した幻想郷~";
          url = "https://music.163.com/#/song?id=766014";
        }
        {
          artist = "沙紗飛鳥";
          title = "夜桜街道";
          album = "東方幽靜響";
          url = "https://music.163.com/#/song?id=26085473";
        }
        {
          artist = "石田燿子";
          title = "COLORFUL BOX";
          album = "COLORFUL BOX / Animetic Love Letter";
          url = "https://music.163.com/#/song?id=29753399";
        }
        {
          artist = "松本文紀";
          title = "夜の向日葵";
          album = "素晴らしき日々 サウンドトラックCD";
          url = "https://music.163.com/#/song?id=4937357";
        }
        {
          artist = "seven oops";
          title = "ReReハロ〜終われそうにない夏〜";
          album = "ReReハロ〜終われそうにない夏〜";
          url = "https://music.163.com/#/song?id=27580227";
        }
        {
          artist = "Sound Horizon";
          title = "美しきもの";
          album = "Roman";
          url = "https://music.163.com/#/song?id=22782025";
        }
        {
          artist = "Sora";
          title = "1秒でも…";
          album = "1秒でも…";
          url = "https://music.163.com/#/song?id=5357641";
        }
        {
          artist = "jyA-Me";
          title = "Dear my friend with CHiE";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1Yt411r7BM";
        }
        {
          artist = "南條愛乃";
          title = "fortuna on the Sixteenth night";
          album = "十六夜のフォルトゥーナ オリジナルサウンドトラック";
          url = "https://music.163.com/#/song?id=28152340";
        }
        {
          artist = "西野カナ";
          title = "Sakura I Love You";
          album = "Nightcore";
          url = "https://www.bilibili.com/video/BV1qY4y1o7Cz";
        }
        {
          artist = "坂上なち";
          title = "サクラ・ホライズン";
          album = "Fortune Music selection of nachi";
          url = "https://music.163.com/#/song?id=32803111";
        }
        {
          artist = "So'Fly";
          title = "i BELIEVE～星に願いを";
          album = "ⅰ BELIEVE ～星に願いを";
          url = "https://music.163.com/#/song?id=831459";
        }
        {
          artist = "KOKIA";
          title = "Spirits";
          album = "アルカディアの蒼き巫女 オリジナル・サウンドトラック";
          url = "https://music.163.com/#/song?id=32069326";
        }
        {
          artist = "一咲美葵";
          title = "紅に染まる恋の花(with Marcia)";
          album = "紅に染まる恋の花";
          url = "https://music.163.com/#/song?id=1438545192";
        }
        {
          artist = "諫山実生";
          title = "あやとり";
          album = "ハナコトバ～花心詩～";
          url = "https://music.163.com/#/song?id=22707944";
        }
        {
          artist = "LiSA";
          title = "crossing field";
          album = "ソードアート・オンライン ソングコレクション";
          url = "https://music.163.com/#/song?id=29027453";
        }
        {
          artist = "ClariS";
          title = "コネクト";
          album = "コネクト";
          url = "https://music.163.com/#/song?id=536622994";
        }
        {
          artist = "紫咲ほたる";
          title = "ことのは";
          album = "Limited Dimension";
          url = "https://music.163.com/#/song?id=721401";
        }
        {
          artist = "F9 & lapix";
          title = "A.S.H";
          album = "Nature";
          url = "https://music.163.com/#/song?id=28587958";
        }
        {
          artist = "牧野由依";
          title = "ジャスミン";
          album = "アムリタ";
          url = "https://music.163.com/#/song?id=610212";
        }
        {
          artist = "鎖那";
          title = "彼女は旅に出る";
          album = "Hush a by little girl";
          url = "https://music.163.com/#/song?id=509106775";
        }
        {
          artist = "発熱巫女~ず";
          title = "Flower of Life";
          album = "アンチェインドメロディ";
          url = "https://music.163.com/#/song?id=745239";
        }
        {
          artist = "めらみぽっぷ";
          title = "童遊";
          album = "望";
          url = "https://music.163.com/#/song?id=28732503";
        }
        {
          artist = "C-CLAYS";
          title = "月明かりの夜、永遠の色";
          album = "YES！";
          url = "https://music.163.com/#/song?id=28921683";
        }
        {
          artist = "仲村芽衣子";
          title = "プロセス";
          album = "DIVINE FORTUNE";
          url = "https://music.163.com/#/song?id=26388032";
        }
        {
          artist = "3L";
          title = "Three Magic";
          album = "BEST OF WiNG";
          url = "https://music.163.com/#/song?id=26565985";
        }
        {
          artist = "Masayoshi Minoshima & 坂上なち ";
          title = "of memories";
          album = "of memories";
          url = "https://music.163.com/#/song?id=22645087";
        }
        {
          artist = "やなぎなぎ & 麻枝准";
          title = "終わりの世界から";
          album = "終わりの惑星のLove Song";
          url = "https://music.163.com/#/song?id=676508";
        }
        {
          artist = "minimum electric design";
          title = "グーテンベルクの科学世紀";
          album = "Two-Tone";
          url = "https://music.163.com/#/song?id=412785540";
        }
        {
          artist = "EastNewSound";
          title = "Replay & Review";
          album = "Auxiliary Brightness";
          url = "https://music.163.com/#/song?id=26127123";
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
      duplicateSongs = lib.pipe metadata [
        (map (x: {
          key = mkFilename x.artist x.title;
        }))
        (builtins.groupBy (entry: entry.key))
        (lib.filterAttrs (_key: entries: builtins.length entries > 1))
        (lib.mapAttrsToList (key: _entries: "Duplicate song ${key} found"))
        lib.concatStrings
      ];
      duplicateSongUrls = lib.pipe metadata [
        (map (x: {
          key = x.url;
        }))
        (builtins.groupBy (entry: entry.key))
        (lib.filterAttrs (_key: entries: builtins.length entries > 1))
        (lib.mapAttrsToList (key: _entries: "Duplicate song url ${key} found"))
        lib.concatStrings
      ];
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
        _onchange = lib.optionalString cfg.download.enable ''
          echo "Downloading music from network"
          $DRY_RUN_CMD ${lib.getExe pkgs.gnumake} -C ${config.home.homeDirectory}/Music/net
        '';
      };
      extraOpts = {
        download = switch;
      };
      value.assertions = [
        {
          assertion = duplicateSongs == "";
          message = duplicateSongs;
        }
        {
          assertion = duplicateSongUrls == "";
          message = duplicateSongUrls;
        }
      ];
    }
  )
)
