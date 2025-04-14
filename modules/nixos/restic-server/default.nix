args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace})
    nixosModule
    enabled
    getDirname
    mkFireholRule
    ;
  port = 3457;
  name = getDirname path;
  value = {
    services = {
      restic.server = enabled // {
        listenAddress = toString port;
        extraFlags = [ "--no-auth" ];
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
