args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace}) nixosModule;
  mkUpdate =
    dbname:
    let
      sqlFile = pkgs.writeText "${dbname}_update_version.sql" ''
        REINDEX DATABASE ${dbname};
        ALTER DATABASE ${dbname} REFRESH COLLATION VERSION;
      '';
    in
    ''
      ${lib.getExe' config.services.postgresql.package "psql"} -d "${dbname}" -f "${sqlFile}"
    '';
  value = {
    systemd.services.postgresql-update = {
      after = [ "postgresql.service" ];
      script = builtins.concatStringsSep "\n" [
        (mkUpdate "postgres")
        (mkUpdate "template1")
      ];
      serviceConfig = {
        User = "postgres";
        Group = "postgres";
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
