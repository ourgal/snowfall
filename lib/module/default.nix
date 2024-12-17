{ lib, inputs, ... }:
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
        if (builtins.isString opt) then
          acc // { ${opt} = enabled; }
        else if (builtins.isAttrs opt) then
          acc
          // (lib.attrsets.foldlAttrs (
            _acc: n: v:
            _acc // { ${n} = enabled // v; }
          ) { } opt)
        else
          builtins.throw "not supported type";
    in
    builtins.foldl' handle { } opts;

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
  jsonFile = file: builtins.fromJSON (builtins.readFile file);

  inherit (inputs.nix-std.lib.serde) toTOML;
  # }}}

  sources = jsonFile ../../_sources/generated.json;

  _sources = import ../../_sources/generated.nix;

  mkRustSource =
    s:
    let
      firstAttrName = v: builtins.head (builtins.attrNames v);
      cargoName = firstAttrName s.cargoLock;
    in
    {
      inherit (s) pname version src;
      cargoLock = s.cargoLock.${cargoName};
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
    mkModuleOpt {
      inherit path;
      value =
        if (type == "list") then
          enabledList subModule
        else if (type == "string") then
          enabledList [ subModule ]
        else
          builtins.throw "not supported type";
      prefix = "modules/home/";
    };

  enableNixosSubModule =
    {
      path,
      subModule ? [ ],
      ...
    }:
    let
      type = builtins.typeOf subModule;
    in
    mkModuleOpt {
      inherit path;
      value =
        if (type == "list") then
          enabledList subModule
        else if (type == "string") then
          enabledList [ subModule ]
        else
          builtins.throw "not supported type";
      prefix = "modules/nixos/";
    };

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
      haskellPkgs ? [ ],
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
      enable ? [ ],
      defaultApps ? { },
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
                      recursive = true;
                    };
                  }
                else if (builtins.isList value) then
                  (builtins.foldl' (acc: v: acc // (setHandle { "${name}" = v; })) { } value)
                else if (builtins.isString value) then
                  { "${name}".text = value; }
                else if (builtins.isAttrs value) then
                  let
                    filename = builtins.baseNameOf name;
                    extension = lib.lists.last (lib.strings.splitString "." filename);
                  in
                  if
                    (builtins.elem extension [
                      "yaml"
                      "yml"
                      "json"
                    ])
                  then
                    { "${name}".text = builtins.toJSON value; }
                  else if (builtins.elem extension [ "toml" ]) then
                    { "${name}".text = toTOML value; }
                  else
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
            acc // { ${n} = enabled // v; }
          ) { } progs
        else if (builtins.isList progs) then
          builtins.foldl' (acc: p: acc // (progsHandle p)) { } progs
        else
          builtins.throw "not supported type";
      pkgHandle =
        prefix: pkgs:
        if (builtins.isString pkgs) then
          [ prefix.${pkgs} ]
        else if (builtins.isFunction pkgs) then
          (pkgs prefix)
        else if (builtins.isList pkgs) then
          (with' prefix pkgs)
        else
          builtins.throw "not support type";
      defaultTypes =
        default: types:
        let
          defaults = builtins.listToAttrs (
            builtins.foldl' (
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
    in
    {
      options.${namespace} = optHome { inherit path extraOpts; };

      config = mkIf cfg.enable (
        lib.attrsets.recursiveUpdate {
          home = {
            packages =
              (pkgHandle pkgs.${namespace} myPkgs)
              ++ (pkgHandle pkgs nixPkgs)
              ++ (pkgHandle pkgs.nodePackages nodePkgs)
              ++ (pkgHandle pkgs.python3Packages pyPkgs)
              ++ (pkgHandle pkgs.dotnetPackages dotnetPkgs)
              ++ (pkgHandle pkgs.perlPackages perlPkgs)
              ++ (pkgHandle pkgs.luaPackages luaPkgs)
              ++ (pkgHandle pkgs.haskellPackages haskellPkgs)
              ++ (pkgHandle pkgs.xorg xorgPkgs)
              ++ (pkgHandle pkgs.xfce xfcePkgs)
              ++ (pkgHandle pkgs.gnome gnomePkgs)
              ++ (pkgHandle pkgs.snowfallorg snowPkgs)
              ++ (pkgHandle pkgs.nvtopPackages nvtopPkgs)
              ++ (inputPkgs inputs);
            file = confHandle files;
            sessionVariables = env;
          };
          xdg.configFile = confHandle confs;
          xdg.dataFile = confHandle dataFiles;
          xdg.mimeApps = {
            enable = true;
            associations.added = defaults;
            defaultApplications = defaults;
          };
          programs = progsHandle progs;
          services = progsHandle servs;
          ${namespace} = enableHomeSubModule {
            inherit path;
            subModule = enable;
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

      config = mkIf cfg.enable value;
    };
  # }}}
}
