args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace enabled;
      fileTypes = [ "x-scheme-handler/akuse" ];
      defaults = lib.${namespace}.defaultTypes "akuse-beta.desktop" fileTypes;
    in
    {
      path = ./.;
      myPkgs = "akuse";
      value = {
        xdg.mimeApps = enabled // {
          associations.added = defaults;
          defaultApplications = defaults;
        };
      };
    }
  )
)
