{ lib, namespace, ... }:
let
  inherit (builtins)
    isInt
    isList
    throw
    all
    foldl'
    isString
    map
    split
    head
    elem
    ;
in
rec {
  dockerPorts =
    host: container:
    let
      toStr = x: y: "${toString x}:${toString y}";
    in
    if isInt host && isInt container then
      [ (toStr host container) ]
    else if isList host && isList container then
      lib.lists.zipListsWith toStr host container
    else
      "";

  dockerOpenFirewall =
    docker:
    let
      containerEnabled = lib.attrsets.filterAttrs (n: v: (n != "enable") && v.enable) docker;
      ports = lib.attrsets.foldlAttrs (
        acc: _: value:
        let
          port =
            if isInt value.ports then
              [ value.ports ]
            else if isList value.ports && all isInt value.ports then
              value.ports
            else
              throw "not supported port type";
        in
        acc ++ port
      ) [ ] containerEnabled;
    in
    {
      networking.firewall = {
        allowedTCPPorts = ports;
        allowedUDPPorts = ports;
      };
    };

  dockerVolume = vname: pname: nfs: nfsPath: {
    "${vname}" =
      if (nfs != "" && nfsPath != "") then
        {
          driver_opts = {
            type = "nfs";
            o = "addr=${nfs},nfsvers=4";
            device = ":${nfsPath}/${pname}_${vname}";
          };
        }
      else
        { };
  };

  dockerVolumes =
    vname: pname: nfs: nfsPath:
    if isList vname then
      foldl' (acc: v: acc // dockerVolume v pname nfs nfsPath) { } vname
    else if isString vname then
      dockerVolume vname pname nfs nfsPath
    else
      throw "not support volume type";

  arionProj =
    {
      cfg,
      name ? cfg.name,
      projectName ? name,
      image,
      imageHost ? "docker.io",
      version ? cfg.version,
      ports ? cfg.ports,
      env ? { },
      containerPorts ? [ ],
      config ? "",
      volumes ? [ ],
      nativeVolumes ? [ ],
      hostname ? "",
      depends ? [ ],
      networks ? "proxy",
      user ? null,
      cmd ? [ ],
      healthcheck ? { },
      nfs ? cfg.nfs,
      nfsPath ? cfg.nfsPath,
    }:
    let
      convert2List =
        v:
        if isString v then
          [ v ]
        else if isList v then
          v
        else
          throw "not support value type";
      _env =
        if image == "postgres" then
          {
            POSTGRES_USER = projectName;
            POSTGRES_DB = projectName;
          }
          // env
        else if
          elem image [
            "mariadb"
            "mysql"
          ]
        then
          {
            MYSQL_DATABASE = projectName;
            MYSQL_RANDOM_ROOT_PASSWORD = "1";
            MYSQL_USER = projectName;
          }
          // env
        else
          env;
      _healthcheck =
        if image == "postgres" then
          {
            test = [
              "CMD"
              "pg_isready"
              "-U"
              projectName
            ];
            interval = "10s";
            start_period = "30s";
          }
          // healthcheck
        else
          healthcheck;
      _name =
        if
          elem image [
            "postgres"
            "mariadb"
            "mysql"
          ]
        then
          "${name}_db"
        else
          name;
      _config = if config != "" then [ "config:${config}" ] else [ ];
      _volumes =
        if image == "postgres" then
          [ "db:/var/lib/postgresql/data" ] ++ (convert2List volumes) ++ _config
        else if
          elem image [
            "mariadb"
            "mysql"
          ]
        then
          [ "db:/var/lib/mysql" ] ++ (convert2List volumes) ++ _config
        else
          (convert2List volumes) ++ _config;
      getMount = v: head (split ":" v);
      mounts =
        if isString _volumes then
          getMount _volumes
        else if isList _volumes then
          map getMount _volumes
        else
          throw "not supported volumes type";
    in
    {
      virtualisation.arion.projects.${projectName}.settings = {
        services.${_name}.service = {
          inherit hostname user;
          name = _name;
          volumes = _volumes ++ (convert2List nativeVolumes);
          image = "${imageHost}/${image}:${version}";
          ports = dockerPorts ports containerPorts;
          environment = _env;
          command = convert2List cmd;
          depends_on = convert2List depends;
          healthcheck = _healthcheck;
          restart = "unless-stopped";
          networks = [ networks ];
        };
        networks.proxy.name = networks;
        docker-compose.volumes = dockerVolumes mounts projectName nfs nfsPath;
      };
    };

  arionProjs = args: foldl' (acc: a: lib.attrsets.recursiveUpdate (arionProj a) acc) { } args;

  dockerOpts =
    {
      name,
      ports ? [ ],
      nfs ? "",
      nfsPath ? "/docker",
      version ? "latest",
      mount ? "",
    }:
    let
      inherit (lib.${namespace}) mkOpt' switch;
      inherit (lib.types)
        str
        port
        either
        listOf
        ;
    in
    {
      name = mkOpt' str name;
      ports = mkOpt' (either port (listOf port)) ports;
      nfs = mkOpt' str nfs;
      nfsPath = mkOpt' str nfsPath;
      version = mkOpt' str version;
      mount = mkOpt' str mount;
      duckdns = switch;
    };
}
