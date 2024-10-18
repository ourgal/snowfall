args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    ;
  cfg = cfgNixos config.${namespace} ./.;
  authCode = lib.strings.fileContents ./authCode.key;
  value = arionProj {
    inherit cfg;
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
    containerPorts = ports;
  };
  name = "siyuan";
  ports = 6806;
  extraOpts = dockerOpts { inherit name ports; };
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
