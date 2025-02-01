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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
