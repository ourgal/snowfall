args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  value = {
    services.borgmatic = enabled // {
      settings = {
        source_directories = [ config.services.postgresqlBackup.location ];
        repositories = [
          {
            path = "ssh://${user}@onecloud.local/./brix.borg";
            label = "onecloud";
          }
        ];
        encryption_passphrase = lib.strings.fileContents ./passphrase.key;
        keep_daily = 7;
        keep_weekly = 4;
        keep_monthly = 6;
      };
    };
    systemd.services.borgmatic = {
      path = [ pkgs.postgresql ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
