args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace enabled;
      fileTypes = [ "x-scheme-handler/miru" ];
      defaults = lib.${namespace}.defaultTypes "miru.desktop" fileTypes;
    in
    {
      path = ./.;
      myPkgs = "miru";
      value = {
        xdg.mimeApps = enabled // {
          associations.added = defaults;
          defaultApplications = defaults;
        };
      };
    }
  )
)
