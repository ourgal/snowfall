{ ... }@args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    mkOpt'
    arionProj
    ;
  cfg = cfgNixos config.${namespace} ./.;
  authCode = lib.strings.fileContents ./authCode.key;
  value =
    with cfg;
    arionProj {
      inherit
        name
        version
        ports
        nfs
        nfsPath
        ;
      image = "b3log/siyuan";
      config = "/siyuan/workspace";
      user = "1000:100";
      cmd = [
        "--workspace=/siyuan/workspace/"
        "--accessAuthCode=${authCode}"
      ];
      env = {
        TZ = "Asia/Shanghai";
      };
      containerPorts = 6806;
    };
  extraOpts = with lib.types; {
    name = mkOpt' str "siyuan";
    ports = mkOpt' port 6806;
    nfs = mkOpt' str "";
    nfsPath = mkOpt' str "/docker";
    version = mkOpt' str "latest";
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
