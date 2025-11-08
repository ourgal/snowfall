{ lib, inputs, ... }:
let
  inherit (builtins)
    isString
    isAttrs
    throw
    foldl'
    map
    isList
    isPath
    baseNameOf
    elem
    toJSON
    isFunction
    listToAttrs
    isInt
    ;
in
rec {

  # misc {{{
  mkOpt =
    type: default: description:
    lib.mkOption { inherit type default description; };

  mkOpt' = type: default: mkOpt type default null;

  mkBoolOpt = mkOpt lib.types.bool;

  mkBoolOpt' = mkOpt' lib.types.bool;

  enabled = {
    enable = true;
  };

  enabledList =
    opts:
    let
      handle =
        acc: opt:
        if (isString opt) then
          acc // { ${opt} = enabled; }
        else if (isAttrs opt) then
          acc
          // (lib.attrsets.foldlAttrs (
            _acc: n: v:
            _acc // { ${n} = enabled // v; }
          ) { } opt)
        else
          throw "not supported type";
    in
    foldl' handle { } opts;

  enableOpt = opts: foldl' (acc: opt: acc // { "${opt}" = true; }) { } opts;

  disabled = {
    enable = false;
  };

  disabledList = opts: foldl' (acc: opt: acc // { "${opt}" = disabled; }) { } opts;

  disableOpt = opts: foldl' (acc: opt: acc // { "${opt}" = false; }) { } opts;

  switch = {
    enable = mkBoolOpt' false;
  };

  with' = prefix: pkgs: map (p: prefix.${p}) pkgs;

  inherit (inputs.nix-std.lib.serde) toTOML;
  # }}}

  sources = lib.importJSON ../../_sources/generated.json;

  _sources = import ../../_sources/generated.nix;

  mkRustSource = s: {
    inherit (s) pname version src;
    cargoLock = s.cargoLock."Cargo.lock";
  };

  mkGoSource = s: {
    inherit (s) pname version src;
    env = {
      GO111MODULE = "on";
      GOPROXY = "https://goproxy.cn";
    };
  };

  mkModuleCfg =
    root: path: prefix:
    let
      currentDir = toString path;
      fileRoot = lib.snowfall.fs.get-file prefix;
      pathSplit = lib.strings.splitString "/" (lib.strings.removePrefix fileRoot currentDir);
      ret = lib.attrsets.getAttrFromPath pathSplit root;
    in
    ret;

  getDirname =
    path:
    let
      currentDir = toString path;
      pathSplit = lib.strings.splitString "/" currentDir;
    in
    lib.lists.last pathSplit;

  mkModuleOpt =
    {
      path,
      prefix,
      extraOpts ? { },
      value ? switch,
      ...
    }:
    let
      currentDir = toString path;
      homeRoot = lib.snowfall.fs.get-file prefix;
      pathSplit = lib.strings.splitString "/" (lib.strings.removePrefix homeRoot currentDir);
      ret = lib.attrsets.setAttrByPath pathSplit (value // extraOpts);
    in
    ret;

  mkModuleOpt' =
    {
      path,
      extraOpts ? { },
      value ? switch,
      ...
    }:
    let
      pathSplit = lib.strings.splitString "/" path;
      ret = lib.attrsets.setAttrByPath pathSplit (value // extraOpts);
    in
    ret;

  # cfgHome config.${namespace} ./. => config.${namespace}.cli.anime.adl
  cfgHome = root: path: (mkModuleCfg root path "modules/home/");

  cfgHome' = root: path: lib.attrsets.getAttrFromPath (lib.strings.splitString "/" path) root;

  # optHome ./. => { cli.anime.adl = switch; }
  optHome =
    {
      path,
      extraOpts ? { },
      ...
    }:
    (mkModuleOpt {
      inherit path extraOpts;
      prefix = "modules/home/";
    });

  optHome' =
    {
      path,
      extraOpts ? { },
      ...
    }:
    mkModuleOpt' { inherit path extraOpts; };

  enableHomeSubModule =
    {
      path,
      subModule ? [ ],
      ...
    }:
    mkModuleOpt {
      inherit path;
      value =
        if (isList subModule) then
          enabledList subModule
        else if (isString subModule) then
          enabledList [ subModule ]
        else
          throw "not supported type";
      prefix = "modules/home/";
    };

  enableHomeSubModule' =
    {
      path,
      subModule ? [ ],
      ...
    }:
    mkModuleOpt' {
      inherit path;
      value =
        if (isList subModule) then
          enabledList subModule
        else if (isString subModule) then
          enabledList [ subModule ]
        else
          throw "not supported type";
    };

  enableNixosSubModule =
    {
      path,
      subModule ? [ ],
      ...
    }:
    mkModuleOpt {
      inherit path;
      value =
        if (isList subModule) then
          enabledList subModule
        else if (isString subModule) then
          enabledList [ subModule ]
        else
          throw "not supported type";
      prefix = "modules/nixos/";
    };

  enableNixosSubModule' =
    {
      path,
      subModule ? [ ],
      ...
    }:
    mkModuleOpt' {
      inherit path;
      value =
        if (isList subModule) then
          enabledList subModule
        else if (isString subModule) then
          enabledList [ subModule ]
        else
          throw "not supported type";
    };
  # cfgNixos config.${namespace} ./. => config.${namespace}.cli.anime.adl
  cfgNixos = root: path: (mkModuleCfg root path "modules/nixos/");

  cfgNixos' = root: path: lib.attrsets.getAttrFromPath (lib.strings.splitString "/" path) root;

  cfgDarwin = root: path: (mkModuleCfg root path "modules/darwin/");

  cfgDarwin' = root: path: lib.attrsets.getAttrFromPath (lib.strings.splitString "/" path) root;

  # optNixos ./. => { cli.anime.adl = switch; }
  optNixos =
    {
      path,
      extraOpts ? { },
      ...
    }:
    mkModuleOpt {
      inherit path extraOpts;
      prefix = "modules/nixos/";
    };

  optNixos' =
    {
      path,
      extraOpts ? { },
      ...
    }:
    mkModuleOpt' { inherit path extraOpts; };

  optDarwin =
    {
      path,
      extraOpts ? { },
      ...
    }:
    mkModuleOpt {
      inherit path extraOpts;
      prefix = "modules/darwin/";
    };

  optDarwin' =
    {
      path,
      extraOpts ? { },
      ...
    }:
    mkModuleOpt' { inherit path extraOpts; };

  # home manager module {{{
  homeModule =
    {
      # args,
      path ? "",
      value ? { },
      myPkgs ? [ ],
      myX86Pkgs ? [ ],
      nixPkgs ? [ ],
      nixX86Pkgs ? [ ],
      nodePkgs ? [ ],
      pyPkgs ? [ ],
      snowPkgs ? [ ],
      xorgPkgs ? [ ],
      dotnetPkgs ? [ ],
      perlPkgs ? [ ],
      luaPkgs ? [ ],
      rubyPkgs ? [ ],
      haskellPkgs ? [ ],
      rPkgs ? [ ],
      xfcePkgs ? [ ],
      gnomePkgs ? [ ],
      inputPkgs ? _p: [ ],
      nvtopPkgs ? [ ],
      extraOpts ? { },
      confs ? [ ],
      files ? [ ],
      dataFiles ? [ ],
      progs ? [ ],
      servs ? [ ],
      env ? { },
      sessionPath ? [ ],
      enable ? [ ],
      tmpfiles ? [ ],
      defaultApps ? { },
      systemdServices ? { },
      _name ? "",
      ...
    }@args:
    let
      inherit (args)
        lib
        namespace
        config
        pkgs
        target
        ;
      inherit (lib) mkIf;
      inherit (lib.${namespace}) cfgHome optHome;
      cfg = if _name == "" then cfgHome config.${namespace} path else cfgHome' config.${namespace} _name;
      confHandle =
        conf:
        let
          setHandle =
            set:
            let
              _handle =
                name: value:
                if (isAttrs value) then
                  let
                    filename = baseNameOf name;
                    extension = lib.lists.last (lib.strings.splitString "." filename);
                  in
                  if
                    (elem extension [
                      "yaml"
                      "yml"
                      "json"
                      "jsonc"
                    ])
                  then
                    { "${name}".text = toJSON value; }
                  else if (elem extension [ "toml" ]) then
                    { "${name}".text = toTOML value; }
                  else
                    { "${name}".source = value; }
                else if (isPath value) then
                  let
                    filename = baseNameOf value;
                    extension = lib.lists.last (lib.strings.splitString "." filename);
                    nameFinal = if (name != "") then name + "/" else "";
                    executable =
                      if
                        (elem extension [
                          "sh"
                          "e"
                        ])
                      then
                        true
                      else
                        false;
                  in
                  {
                    "${nameFinal}${filename}" = {
                      source = value;
                      inherit executable;
                      recursive = true;
                    };
                  }
                else if (isList value) then
                  (foldl' (acc: v: acc // (setHandle { "${name}" = v; })) { } value)
                else if (isString value) then
                  { "${name}".text = value; }
                else if (isAttrs value) then
                  let
                    filename = baseNameOf name;
                    extension = lib.lists.last (lib.strings.splitString "." filename);
                  in
                  if
                    (elem extension [
                      "yaml"
                      "yml"
                      "json"
                      "jsonc"
                    ])
                  then
                    { "${name}".text = toJSON value; }
                  else if (elem extension [ "toml" ]) then
                    { "${name}".text = toTOML value; }
                  else
                    { "${name}".source = value; }
                else
                  throw "not supported type";
            in
            lib.attrsets.foldlAttrs (
              acc: n: v:
              acc // (_handle n v)
            ) { } set;
        in
        if (isAttrs conf) then
          (setHandle conf)
        else if (isList conf) then
          foldl' (acc: c: acc // (setHandle c)) { } conf
        else
          throw "not supported type";
      progsHandle =
        progs:
        if (isString progs) then
          { ${progs} = enabled; }
        else if (isAttrs progs) then
          lib.attrsets.foldlAttrs (
            acc: n: v:
            acc
            // (
              if n == "lazyvim" then
                {
                  ${n} =
                    enabled
                    // v
                    // {
                      treesitterParsers = with' pkgs.tree-sitter-grammars (
                        map (x: "tree-sitter-${x}") v.treesitterParsers
                      );
                    };
                }
              else if n == "vim" && v ? plugins then
                {
                  ${n} =
                    enabled
                    // v
                    // (
                      if v ? plugins then
                        (
                          if isList v.plugins then
                            {
                              plugins = map (
                                x:
                                if isString x && pkgs.${namespace} ? ${x} then
                                  pkgs.${namespace}.${x}
                                else if isString x && pkgs.vimPlugins ? ${x} then
                                  pkgs.vimPlugins.${x}
                                else
                                  x
                              ) v.plugins;
                            }
                          else if isString v.plugins then
                            {
                              plugins =

                                if pkgs.${namespace} ? ${v.plugins} then
                                  [ pkgs.${namespace}.${v.plugins} ]
                                else if pkgs.vimPlugins ? ${v.plugins} then
                                  [ pkgs.vimPlugins.${v.plugins} ]
                                else
                                  builtins.throw "vim plugin not found";
                            }
                          else
                            builtins.throw "unsupported vim plugin type"
                        )
                      else
                        { }
                    )
                    // (
                      if v ? extraConfig && isPath v.extraConfig then
                        { extraConfig = builtins.readFile v.extraConfig; }
                      else
                        { }
                    );
                }
              else
                { ${n} = enabled // v; }
            )
          ) { } progs
        else if (isList progs) then
          foldl' (acc: p: acc // (progsHandle p)) { } progs
        else
          throw "not supported type";
      pkgHandle =
        prefix: pkgs:
        if (isString pkgs) then
          [ prefix.${pkgs} ]
        else if (isFunction pkgs) then
          (pkgs prefix)
        else if (isList pkgs) then
          (with' prefix pkgs)
        else
          throw "not support type";
      defaultTypes =
        default: types:
        let
          defaults = listToAttrs (
            foldl' (
              acc: type:
              acc
              ++ [
                {
                  name = type;
                  value = default;
                }
              ]
            ) [ ] types
          );
        in
        defaults;
      defaults = lib.attrsets.foldlAttrs (
        acc: n: v:
        acc // defaultTypes n v
      ) { } defaultApps;
      _systemdServices =
        let
          ret = lib.attrsets.foldlAttrs (
            acc: name: value:
            let
              newVal = {
                Install = {
                  WantedBy = [
                    (if ((value ? gui) && value.gui) then "graphical-session.target" else "default.target")
                  ];
                };
                Unit = {
                  Description = "${name} Service";
                }
                // (
                  if ((value ? online) && value.online) then
                    {
                      Wants = "network-online.target";
                      After = "network-online.target";
                    }
                  else
                    { }
                )
                // (if (value ? condEnv) then { ConditionEnvironment = value.condEnv; } else { })
                // (if (value ? after) then { After = value.after; } else { });
                Service = {
                  ExecStart = if (value ? start) then value.start else "";
                  RestartSec = 10;
                }
                // (if (value ? type) then { Type = value.type; } else { Type = "simple"; })
                // (if (value ? nice) then { Nice = value.nice; } else { })
                // (if (value ? restart) then { Restart = value.restart; } else { Restart = "always"; })
                // (if (value ? reload) then { ExecReload = value.reload; } else { })
                // (if (value ? start) then { ExecStart = value.start; } else { })
                // (if (value ? startPre) then { ExecStartPre = value.startPre; } else { })
                // (if (value ? env) then { Environment = value.env; } else { });
              }
              // value;
            in
            acc
            // {
              "${name}" =
                if (value != { }) then
                  lib.attrsets.filterAttrs (
                    n: _v:
                    !elem n [
                      "online"
                      "start"
                      "reload"
                      "restart"
                      "type"
                      "gui"
                      "condEnv"
                      "nice"
                      "startPre"
                      "after"
                      "env"
                    ]
                  ) newVal
                else
                  value;
            }
          ) { } systemdServices;
        in
        ret;
    in
    {
      options.${namespace} =
        if _name == "" then
          optHome { inherit path extraOpts; }
        else
          optHome' {
            path = _name;
            inherit extraOpts;
          };

      config = mkIf cfg.enable (
        lib.attrsets.recursiveUpdate {
          home = {
            packages =
              (pkgHandle pkgs.${namespace} myPkgs)
              ++ (pkgHandle pkgs.${namespace} (isX86 target myX86Pkgs))
              ++ (pkgHandle pkgs nixPkgs)
              ++ (pkgHandle pkgs (isX86 target nixX86Pkgs))
              ++ (pkgHandle pkgs.nodePackages nodePkgs)
              ++ (pkgHandle pkgs.python3Packages pyPkgs)
              ++ (pkgHandle pkgs.dotnetPackages dotnetPkgs)
              ++ (pkgHandle pkgs.perlPackages perlPkgs)
              ++ (pkgHandle pkgs.luaPackages luaPkgs)
              ++ (pkgHandle pkgs.rubyPackages rubyPkgs)
              ++ (pkgHandle pkgs.haskellPackages haskellPkgs)
              ++ (pkgHandle pkgs.rPackages rPkgs)
              ++ (pkgHandle pkgs.xorg xorgPkgs)
              ++ (pkgHandle pkgs.xfce xfcePkgs)
              ++ (pkgHandle pkgs.gnome gnomePkgs)
              ++ (pkgHandle pkgs.snowfallorg snowPkgs)
              ++ (pkgHandle pkgs.nvtopPackages nvtopPkgs)
              ++ (inputPkgs inputs);
            file = confHandle files;
            sessionVariables = env;
            inherit sessionPath;
          };
          xdg = {
            configFile = confHandle confs;
            dataFile = confHandle dataFiles;
            mimeApps = {
              enable = true;
              associations.added = defaults;
              defaultApplications = defaults;
            };
          };
          programs = progsHandle progs;
          services = progsHandle servs;
          ${namespace} =
            if _name == "" then
              enableHomeSubModule {
                inherit path;
                subModule = enable;
              }
            else
              enableHomeSubModule' {
                path = _name;
                subModule = enable;
              };
          systemd.user = {
            services = _systemdServices;
            tmpfiles.rules = tmpfiles;
          };
        } value
      );
    };
  # }}}

  # nixos module {{{
  nixosModule =
    {
      args,
      value ? { },
      path ? "",
      extraOpts ? { },
      enable ? [ ],
      ...
    }:
    let
      inherit (args)
        lib
        namespace
        config
        _name
        ;
      inherit (lib) mkIf;
      cfg =
        if _name == "" then cfgNixos config.${namespace} path else cfgNixos' config.${namespace} _name;
    in
    {
      options.${namespace} =
        if _name == "" then
          optNixos { inherit path extraOpts; }
        else
          optNixos' {
            path = _name;
            inherit extraOpts;
          };

      config = mkIf cfg.enable (
        lib.attrsets.recursiveUpdate {
          ${namespace} =
            if _name == "" then
              enableNixosSubModule {
                inherit path;
                subModule = enable;
              }
            else
              enableNixosSubModule' {
                path = _name;
                subModule = enable;
              };
        } value
      );
    };
  # }}}

  # darwin module {{{
  darwinModule =
    {
      args,
      value ? { },
      path ? "",
      extraOpts ? { },
      enable ? [ ],
      ...
    }:
    let
      inherit (args)
        lib
        namespace
        config
        _name
        ;
      inherit (lib) mkIf;
      cfg =
        if _name == "" then cfgDarwin config.${namespace} path else cfgDarwin' config.${namespace} _name;
    in
    {
      options.${namespace} =
        if _name == "" then
          optDarwin { inherit path extraOpts; }
        else
          optDarwin' {
            path = _name;
            inherit extraOpts;
          };

      config = mkIf cfg.enable (
        lib.attrsets.recursiveUpdate {
          ${namespace} =
            if _name == "" then
              enableNixosSubModule {
                inherit path;
                subModule = enable;
              }
            else
              enableNixosSubModule' {
                path = _name;
                subModule = enable;
              };
        } value
      );
    };
  # }}}

  mkFireholRule =
    {
      name,
      tcp ? [ ],
      udp ? [ ],
    }:
    let
      tcp' = if isInt tcp then [ tcp ] else tcp;
      udp' = if isInt udp then [ udp ] else udp;
      convertPorts = foldl' (
        acc: v:
        if isInt v then
          acc // { tcp = acc.tcp ++ [ v ]; }
        else if isAttrs v then
          acc // { tcpRange = acc.tcpRange ++ [ v ]; }
        else
          throw "not supported type"
      );
      tcpPorts = convertPorts {
        tcp = [ ];
        tcpRange = [ ];
      } tcp';
      udpPorts = convertPorts {
        udp = [ ];
        udpRange = [ ];
      } udp';
      allPorts =
        let
          flat = foldl' (acc: v: acc ++ lib.range v.from v.to) [ ];
        in
        lib.lists.unique (
          tcpPorts.tcp ++ udpPorts.udp ++ (flat tcpPorts.tcpRange) ++ (flat udpPorts.udpRange)
        );
    in
    {
      user.ports = allPorts;
      firehol.services = [
        {
          inherit name;
          inherit (tcpPorts) tcp tcpRange;
          inherit (udpPorts) udp udpRange;
        }
      ];
    };

  commonServiceConfig = {
    Type = "simple";
    Restart = "on-failure";
    RestartSec = 3;

    # Hardening
    CapabilityBoundingSet = "";
    NoNewPrivileges = true;
    PrivateUsers = true;
    PrivateTmp = true;
    PrivateMounts = true;
    ProtectClock = true;
    ProtectControlGroups = true;
    ProtectHome = true;
    ProtectHostname = true;
    ProtectKernelLogs = true;
    ProtectKernelModules = true;
    ProtectKernelTunables = true;
    RestrictAddressFamilies = [
      "AF_INET"
      "AF_INET6"
      "AF_UNIX"
    ];
    RestrictNamespaces = true;
    RestrictRealtime = true;
    RestrictSUIDSGID = true;
    UMask = "0077";
  };

  isX86 =
    target: pkgs:
    if isString pkgs then
      lib.optional (target == "x86_64-linux") pkgs
    else if isList pkgs then
      lib.optionals (target == "x86_64-linux") pkgs
    else if (isFunction pkgs) then
      if target == "x86_64-linux" then pkgs else _: [ ]
    else
      throw "pkgs is neither string nor list nor function";

  SpecialArgs = {
    module = homeModule;
    inherit
      enabledList
      disabledList
      enabled
      disabled
      enableOpt
      disableOpt
      mkOpt'
      cfgHome
      switch
      sources
      toTOML
      ;
  };
  mkSystemUser = name: {
    users = {
      users.${name} = {
        description = "${lib.capitalize name} Service User";
        home = "/var/lib/${name}";
        createHome = true;
        isSystemUser = true;
        group = name;
      };
      groups.${name} = { };
    };
  };
}
