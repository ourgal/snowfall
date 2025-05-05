args:
args.module (
  args
  // {
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
      ];
      setups = [
        {
          id = "home";
          apps = [
            "com.vrem.wifianalyzer"
            "kzs.th000.tsdm_client"
            "me.hackerchick.raisetoanswer"
            "org.moire.ultrasonic"
            "biz.binarysolutions.healthybatterycharging"
            "org.oxycblt.auxio"
            "com.machiav3lli.fdroid"
            "org.smssecure.smssecure"
            "org.videolan.vlc"
            "org.gateshipone.malp"
            "dev.jdtech.jellyfin"
            "com.gianlu.aria2app"
            "de.srlabs.snoopsnitch"
            "de.badaix.snapcast"
            "com.github.catfriend1.syncthingandroid"
            "com.apps.adrcotfas.goodtime"
            "com.github.axet.smsgate"
            "org.fdroid.fdroid"
            "org.telegram.messenger"
            "me.echeung.moemoekyun.fdroid"
            "org.koitharu.kotatsu"
            "ch.protonvpn.android"
            "com.axiel7.anihyou"
            "io.github.friesi23.mhabit"
            "com.github.libretube"
            "app.alextran.immich"
            "org.koreader.launcher.fdroid"
            "chat.simplex.app"
            "me.hackerchick.catima"
            "com.google.zxing.client.android"
            "org.kde.kdeconnect_tp"
            "is.xyz.mpv"
            "com.osfans.trime"
            "com.tailscale.ipn"
            "org.jellyfin.mobile"
            "org.schabi.newpipe"
            "github.daneren2005.dsub"
            "me.bgregos.brighttask"
            "com.ichi2.anki"
          ];
          repos = [
            "f-droid"
            "f-droid-archive"
          ];
        }
      ];
    };
  }
)
