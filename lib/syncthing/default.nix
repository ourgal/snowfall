{ lib, namespace, ... }:
{
  mkSyncthingFolders =
    {
      dataDir,
      host,
      folders, # {folder = [ "host a" "host b" ];}
    }:
    let
      folder =
        {
          name,
          dataDir,
          host,
          hosts ? [ ],
        }:
        let
          devices = if (builtins.elem host hosts) then builtins.filter (e: e != host) hosts else [ ];
        in
        {
          path = "${dataDir}/${name}";
          inherit devices;
        };
    in
    lib.attrsets.mapAttrs (
      n: v:
      folder {
        inherit dataDir host;
        name = n;
        hosts = v;
      }
    ) folders;
  syncthing = {
    devices = {
      brix = {
        id = "SAFK7DR-JSFF3DS-6TCELEO-LX6TBQB-GHEDH7U-K376ZO3-4W56FPA-AI34CA3";
        autoAcceptFolders = true;
      };
      home = {
        id = "B7GGOHW-ZOIRPZD-7ZE5MRQ-M55IKVP-US7BZH3-T6UXXKG-J3COIN2-RZALYAO";
        autoAcceptFolders = true;
      };
      surface = {
        id = "R3A5ZU7-22YYIX5-GARMIR7-IK7BWRP-WDXVDCT-7GQLKKZ-AYZU55X-KYN54QS";
        autoAcceptFolders = true;
      };
      air = {
        id = "ZUFZMMQ-GQCZNZG-CJJLM6C-ZAQ3N72-DDB7UWG-557BNYG-BF7JDH2-DVDWYAR";
        autoAcceptFolders = true;
      };
      nuc = {
        id = "C2Z5Q2H-F5EGNLP-P5XHXUN-S6EIDTY-IKJSTGJ-VJVMMO5-YQXI7ZF-227QKAX";
        autoAcceptFolders = true;
      };
    };
    folders =
      let
        inherit (lib.${namespace}.settings) desktops windows;
        inherit (lib.${namespace}.settings.servers) syncthing;
      in
      {
        doom = desktops ++ syncthing;
        lazyvim = desktops ++ syncthing;
        lvim = desktops ++ syncthing;
        music = desktops ++ syncthing;
        nap = desktops ++ syncthing;
        task = desktops ++ syncthing;
        todo = desktops ++ syncthing;
        vim = desktops ++ syncthing;
        buku = desktops ++ windows ++ syncthing;
        jrnl = desktops ++ syncthing;
        books = [ "home" ] ++ syncthing;
        wenku = [ "home" ] ++ syncthing;
        gal-save = [ "nuc" ] ++ syncthing;
        game-save = [ "nuc" ] ++ syncthing;
        documents = desktops ++ syncthing;
        timew = desktops ++ syncthing;
      };
  };
}
