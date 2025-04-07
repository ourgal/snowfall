args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    cfgNixos
    arionProj
    dockerOpts
    getDirname
    mkFireholRule
    ;
  cfg = cfgNixos config.${namespace} ./.;
  authCode = lib.strings.fileContents ./authCode.key;
  value =
    (arionProj {
      inherit cfg;
      inherit (lib.${namespace}.sources."docker-${name}") src;
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
    })
    // {
      ${namespace} = mkFireholRule {
        inherit name;
        tcp = cfg.ports;
      };
    };
  name = getDirname path;
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
