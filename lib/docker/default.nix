{ lib, ... }:
rec {
  dockerPorts =
    host: container:
    let
      toStr = x: y: "${toString x}:${toString y}";
    in
    if builtins.isInt host && builtins.isInt container then
      [ (toStr host container) ]
    else if builtins.isList host && builtins.isList container then
      lib.lists.zipListsWith toStr host container
    else
      "";

  dockerOpenFirewall =
    docker:
    let
      containerEnabled = lib.attrsets.filterAttrs (n: v: (n != "enable") && (v.enable == true)) docker;
      ports = lib.attrsets.foldlAttrs (
        acc: name: value:
        let
          port =
            if builtins.isInt value.ports then
              [ value.ports ]
            else if builtins.isList value.ports && builtins.all builtins.isInt value.ports then
              value.ports
            else
              builtins.throw "not supported port type";
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
    "${vname}" = {
      driver_opts = {
        type = "nfs";
        o = "addr=${nfs},nfsvers=4";
        device = ":${nfsPath}/${pname}_${vname}";
      };
    };
  };

  dockerVolumes =
    vname: pname: nfs: nfsPath:
    if builtins.isList vname then
      builtins.foldl' (acc: v: acc // dockerVolume v pname nfs nfsPath) { } vname
    else if builtins.isString vname then
      dockerVolume vname pname nfs nfsPath
    else
      builtins.throw "not support volume type";

  arionProj =
    {
      name,
      projectName ? name,
      image,
      imageHost ? "docker.io",
      version ? "latest",
      ports ? [ ],
      env ? { },
      containerPorts ? [ ],
      config ? "",
      volumes ? [ ],
      nativeVolumes ? [ ],
      hostname ? "",
      depends ? [ ],
      networks ? "proxy",
      cmd ? [ ],
      healthcheck ? { },
      nfs ? "",
      nfsPath ? "docker",
    }:
    let
      convert2List =
        v:
        if builtins.isString v then
          [ v ]
        else if builtins.isList v then
          v
        else
          builtins.throw "not support value type";
      _env =
        if image == "postgres" then
          {
            POSTGRES_USER = projectName;
            POSTGRES_DB = projectName;
          }
          // env
        else if
          builtins.elem image [
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
          builtins.elem image [
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
          builtins.elem image [
            "mariadb"
            "mysql"
          ]
        then
          [ "db:/var/lib/mysql" ] ++ (convert2List volumes) ++ _config
        else
          (convert2List volumes) ++ _config;
      getMount = v: builtins.head (builtins.split ":" v);
      mounts =
        if builtins.isString _volumes then
          getMount _volumes
        else if builtins.isList _volumes then
          builtins.map getMount _volumes
        else
          builtins.throw "not supported volumes type";
    in
    {
      virtualisation.arion.projects.${projectName}.settings = {
        services.${_name}.service = {
          inherit hostname;
          name = _name;
          volumes = _volumes ++ (convert2List nativeVolumes);
          image = "${imageHost}/${image}:${version}";
          ports = dockerPorts ports containerPorts;
          environment = _env;
          command = (convert2List cmd);
          depends_on = (convert2List depends);
          healthcheck = _healthcheck;
          restart = "unless-stopped";
          networks = [ networks ];
        };
        networks.proxy.name = networks;
        docker-compose.volumes = dockerVolumes mounts projectName nfs nfsPath;
      };
    };

  arionProjs =
    args: builtins.foldl' (acc: a: lib.attrsets.recursiveUpdate (arionProj a) acc) { } args;
}
