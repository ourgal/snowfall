args:
args.module (
  args
  // (
    let
      wifi = [
        "com.vrem.wifianalyzer" # WiFiAnalyzer, Optimize your WiFi network
        "de.srlabs.snoopsnitch" # SnoopSnitch, Check mobile network security
      ];
      phone = [
        "me.hackerchick.raisetoanswer" # Raise To Answer, Simply hold your phone to your ear to answer an incoming call
        "spam.blocker" # SpamBlocker (Call & SMS), Spam Call/SMS blocker
      ];
      music = [
        "org.moire.ultrasonic" # Ultrasonic, A music streaming client for Subsonic servers
        "org.oxycblt.auxio" # Auxio, A simple, rational music player
        "org.gateshipone.malp" # M.A.L.P., M.A.L.P. - MPD Client
        "de.badaix.snapcast" # Snapcast - multi-room audio in perfect, sync Snapcast client for Android
        "me.echeung.moemoekyun.fdroid" # LISTEN.moe, Listen to j-pop and anime music radio 24/7 ad-free
        "github.paroj.dsub2000" # DSub2000, Android client for Subsonic servers.
      ];
      battery = [
        "biz.binarysolutions.healthybatterycharging" # Healthy Battery Charging, Prolong the life of your battery by keeping it charged between 40% and 80%
      ];
      store = [
        "com.machiav3lli.fdroid" # Neo Store, A modern feature-rich F-Droid client
        "org.fdroid.fdroid" # F-Droid, The app store that respects freedom and privacy
      ];
      video = [
        "org.videolan.vlc" # VLC, The best video and music player. Fast and “just works”, plays any file
        "dev.jdtech.jellyfin" # Findroid, Third-party native Jellyfin app
        "com.github.libretube" # LibreTube, Alternative YouTube frontend for Android built with Piped
        "is.xyz.mpv" # mpv-android, Listen to music and watch videos
        "org.jellyfin.mobile" # Jellyfin - your media in your hands!, Mobile client for Jellyfin, the free software media system
        "org.schabi.newpipe" # NewPipe, Lightweight YouTube frontend
      ];
      download = [
        "com.gianlu.aria2app" # Aria2App, An advanced download manager and aria2 client for your pocket.
      ];
      sync = [
        "com.github.catfriend1.syncthingandroid" # Syncthing-Fork, Wrapper for Syncthing - Open and decentralized file synchronization
      ];
      chat = [
        "org.telegram.messenger" # Telegram FOSS, Telegram is a messaging app with a focus on speed and security.
        "chat.simplex.app" # SimpleX Chat, SimpleX Chat - e2e encrypted messenger without any user IDs - private by design!
      ];
      manga = [
        "org.koitharu.kotatsu" # Kotatsu, Manga reader with online catalogues
      ];
      proxy = [
        "ch.protonvpn.android" # ProtonVPN - Secure and Free VPN, Free Swiss VPN with advanced security and privacy features.
        "com.tailscale.ipn" # Tailscale, Mesh VPN based on WireGuard
      ];
      anime = [
        "com.axiel7.anihyou" # AniHyou - AniList client, Another unofficial Android AniList client
        "com.predidit.kazumi" # Kazumi, An anime collection APP based on custom rules.
        "com.example.knkpanime" # knkpanime, Anime app with multiple source and danmaku support
        "org.github.henryquan.animeone" # AnimeOne, Unofficial AnimeOne client
        "io.github.jica98"
      ];
      ebook = [
        "org.koreader.launcher.fdroid" # KOReader, Ebook reader
      ];
      integratetion = [
        "org.kde.kdeconnect_tp" # KDE Connect, KDE Connect integrates your smartphone and computer
      ];
      IME = [
        "com.osfans.trime" # Trime, Chinese IME with Rime Input Method Engine
      ];
      weather = [
        "org.breezyweather" # Breezy Weather, A powerful, open-source Material Design weather app.
      ];
      share = [
        "com.github.howeyc.crocgui" # croc, Easily and securely send things from one computer to another
      ];
      git = [
        "com.catpuppyapp.puppygit.play.pro" # PuppyGit Pro is a Git client for Android. Open Source, no Ads and free to use.
      ];
      editor = [ "com.droidvim" ];
      termux = [
        "com.termux"
        "com.termux.api"
      ];
      todo = [
        "de.tnmgl.ntodotxt"
        "org.tasks"
      ];
    in
    {
      myPkgs = "fdroidcl";
      confs."fdroidcl/config.toml" = {
        repos = [
          {
            id = "f-droid";
            url = "https://f-droid.org/repo";
            enabled = true;
          }
          {
            id = "f-droid-archive";
            url = "https://f-droid.org/archive";
            enabled = false;
          }
          {
            id = "cernet";
            url = "https://mirrors.cernet.edu.cn/fdroid/repo";
            enabled = false;
          }
          {
            id = "nju";
            url = "https://mirror.nju.edu.cn/fdroid/repo";
            enabled = false;
          }
          {
            id = "lzzy";
            url = "https://apt.izzysoft.de/fdroid/repo";
            enabled = true;
          }
        ];
        setups =
          let
            repos = [ "f-droid" ];
          in
          [
            {
              id = "phone";
              apps =
                phone
                ++ music
                ++ battery
                ++ video
                ++ download
                ++ sync
                ++ chat
                ++ manga
                ++ proxy
                ++ anime
                ++ ebook
                ++ integratetion
                ++ IME
                ++ termux
                ++ weather
                ++ todo;
              inherit repos;
            }
            {
              id = "sub-phone";
              apps = phone ++ battery ++ sync ++ integratetion ++ IME ++ weather ++ termux ++ todo;
              inherit repos;
            }
            {
              id = "tablet";
              apps =
                wifi
                ++ battery
                ++ music
                ++ video
                ++ download
                ++ sync
                ++ manga
                ++ anime
                ++ ebook
                ++ integratetion
                ++ IME
                ++ store
                ++ weather
                ++ share
                ++ git
                ++ termux
                ++ editor;
              inherit repos;
            }
          ];
      };
    }
  )
)
