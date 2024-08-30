{ lib, ... }:
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

  enabledList = opts: builtins.foldl' (acc: opt: acc // { "${opt}" = enabled; }) { } opts;

  enableOpt = opts: builtins.foldl' (acc: opt: acc // { "${opt}" = true; }) { } opts;

  disabled = {
    enable = false;
  };

  disabledList = opts: builtins.foldl' (acc: opt: acc // { "${opt}" = disabled; }) { } opts;

  disableOpt = opts: builtins.foldl' (acc: opt: acc // { "${opt}" = false; }) { } opts;

  switch = {
    enable = mkBoolOpt' false;
  };

  with' = prefix: pkgs: builtins.map (p: prefix.${p}) pkgs;

  tomlFile = file: builtins.fromTOML (builtins.readFile file);
  # }}}

  mkModuleCfg =
    root: path: prefix:
    let
      currentDir = toString path;
      fileRoot = lib.snowfall.fs.get-file prefix;
      pathSplit = lib.strings.splitString "/" (lib.strings.removePrefix fileRoot currentDir);
      ret = lib.attrsets.getAttrFromPath pathSplit root;
    in
    ret;

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

  # cfgHome config.${namespace} ./. => config.${namespace}.cli.anime.adl
  cfgHome = root: path: (mkModuleCfg root path "modules/home/");

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

  enableHomeSubModule =
    {
      path,
      subModule ? [ ],
      ...
    }:
    let
      type = builtins.typeOf subModule;
    in
    (mkModuleOpt {
      inherit path;
      value =
        if (type == "list") then
          enabledList subModule
        else if (type == "string") then
          enabledList [ subModule ]
        else
          builtins.throw "not supported type";
      prefix = "modules/home/";
    });

  enableNixosSubModule =
    {
      path,
      subModule ? [ ],
      ...
    }:
    let
      type = builtins.typeOf subModule;
    in
    (mkModuleOpt {
      inherit path;
      value =
        if (type == "list") then
          enabledList subModule
        else if (type == "string") then
          enabledList [ subModule ]
        else
          builtins.throw "not supported type";
      prefix = "modules/nixos/";
    });

  # cfgNixos config.${namespace} ./. => config.${namespace}.cli.anime.adl
  cfgNixos = root: path: (mkModuleCfg root path "modules/nixos/");

  # optNixos ./. => { cli.anime.adl = switch; }
  optNixos =
    {
      path,
      extraOpts ? { },
      ...
    }:
    (mkModuleOpt {
      inherit path extraOpts;
      prefix = "modules/nixos/";
    });

  # home manager module {{{
  homeModule =
    {
      # args,
      path,
      value ? { },
      myPkgs ? [ ],
      nixPkgs ? [ ],
      nodePkgs ? [ ],
      pyPkgs ? [ ],
      snowPkgs ? [ ],
      xorgPkgs ? [ ],
      dotnetPkgs ? [ ],
      perlPkgs ? [ ],
      luaPkgs ? [ ],
      xfcePkgs ? [ ],
      inputPkgs ? [ ],
      extraOpts ? { },
      confs ? [ ],
      files ? [ ],
      dataFiles ? [ ],
      progs ? [ ],
      servs ? [ ],
      env ? { },
      enable ? [ ],
      ...
    }@args:
    let
      inherit (args)
        lib
        namespace
        config
        pkgs
        ;
      inherit (lib) mkIf;
      inherit (lib.${namespace}) cfgHome optHome;
      cfg = cfgHome config.${namespace} path;
      confHandle =
        conf:
        let
          setHandle =
            set:
            let
              _handle =
                name: value:
                if (builtins.isPath value) then
                  let
                    filename = builtins.baseNameOf value;
                    extension = lib.lists.last (lib.strings.splitString "." filename);
                    nameFinal = if (name != "") then name + "/" else "";
                    executable = if (builtins.elem extension [ "sh" ]) then true else false;
                  in
                  {
                    "${nameFinal}${filename}" = {
                      source = value;
                      inherit executable;
                    };
                  }
                else if (builtins.isList value) then
                  (builtins.foldl' (acc: v: acc // (setHandle { "${name}" = v; })) { } value)
                else if (builtins.isString value) then
                  { "${name}".text = value; }
                else if (builtins.isAttrs value) then
                  { "${name}".source = value; }
                else
                  builtins.throw "not supported type";
            in
            lib.attrsets.foldlAttrs (
              acc: n: v:
              acc // (_handle n v)
            ) { } set;
        in
        if (builtins.isAttrs conf) then
          (setHandle conf)
        else if (builtins.isList conf) then
          builtins.foldl' (acc: c: acc // (setHandle c)) { } conf
        else
          builtins.throw "not supported type";
      progsHandle =
        progs:
        if (builtins.isString progs) then
          { ${progs} = enabled; }
        else if (builtins.isAttrs progs) then
          lib.attrsets.foldlAttrs (
            acc: n: v:
            acc // { ${n} = (enabled // v); }
          ) { } progs
        else if (builtins.isList progs) then
          builtins.foldl' (acc: p: acc // (progsHandle p)) { } progs
        else
          builtins.throw "not supported type";
      pkgHandle =
        prefix: pkgs: if (builtins.isString pkgs) then [ prefix.${pkgs} ] else (with' prefix pkgs);
    in
    {
      options.${namespace} = optHome { inherit path extraOpts; };

      config = mkIf cfg.enable (
        lib.attrsets.recursiveUpdate ({
          home.packages =
            (pkgHandle pkgs.${namespace} myPkgs)
            ++ (pkgHandle pkgs nixPkgs)
            ++ (pkgHandle pkgs.nodePackages nodePkgs)
            ++ (pkgHandle pkgs.python3Packages pyPkgs)
            ++ (pkgHandle pkgs.dotnetPackages dotnetPkgs)
            ++ (pkgHandle pkgs.perlPackages perlPkgs)
            ++ (pkgHandle pkgs.luaPackages luaPkgs)
            ++ (pkgHandle pkgs.xorg xorgPkgs)
            ++ (pkgHandle pkgs.xfce xfcePkgs)
            ++ (pkgHandle pkgs.snowfallorg snowPkgs)
            ++ (inputPkgs);
          xdg.configFile = (confHandle confs);
          xdg.dataFile = (confHandle dataFiles);
          home.file = (confHandle files);
          programs = (progsHandle progs);
          services = (progsHandle servs);
          home.sessionVariables = env;
          ${namespace} = enableHomeSubModule {
            inherit path;
            subModule = enable;
          };
        }) value
      );
    };
  # }}}

  # nixos module {{{
  nixosModule =
    {
      args,
      value ? { },
      path,
      extraOpts ? { },
      ...
    }:
    let
      inherit (args) lib namespace config;
      inherit (lib) mkIf;
      inherit (lib.${namespace}) optNixos cfgNixos;
      cfg = cfgNixos config.${namespace} path;
    in
    {
      options.${namespace} = optNixos { inherit path extraOpts; };

      config = mkIf cfg.enable (value);
    };
  # }}}
}
