{
  nixPkgs = [
    # keep-sorted start
    "ghcid"
    "stack"
    # keep-sorted end
  ];
  files.".stack/config.yaml" = {
    package-index = {
      download-prefix = "https://mirrors.cernet.edu.cn/hackage/";
      hackage-security = {
        keyids = [
          "0a5c7ea47cd1b15f01f5f51a33adda7e655bc0f0b0615baa8e271f4c3351e21d"
          "1ea9ba32c526d1cc91ab5e5bd364ec5e9e8cb67179a471872f6e26f0ae773d42"
          "280b10153a522681163658cb49f632cde3f38d768b736ddbc901d99a1a772833"
          "2a96b1889dc221c17296fcc2bb34b908ca9734376f0f361660200935916ef201"
          "2c6c3627bd6c982990239487f1abd02e08a02e6cf16edb105a8012d444d870c3"
          "51f0161b906011b52c6613376b1ae937670da69322113a246a09f807c62f6921"
          "772e9f4c7db33d251d5c6e357199c819e569d130857dc225549b40845ff0890d"
          "aa315286e6ad281ad61182235533c41e806e5a787e0b6d1e7eef3f09d137d2e9"
          "fe331502606802feac15e514d9b9ea83fee8b6ffef71335479a2e68d84adc6b0"
        ];
        key-threshold = 3;
        ignore-expiry = false;
      };
    };
  };
}
