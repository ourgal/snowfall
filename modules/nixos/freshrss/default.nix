args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.freshrss = enabled // {
      baseUrl = "http://freshrss.zxc.cn";
      passwordFile = "/etc/freshrss/secret";
    };
    environment.etc."freshrss/secret".text = lib.strings.fileContents ./secret.key;
  };
  _args = { inherit value args; };
in
nixosModule _args
