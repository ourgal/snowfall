args:
args.module (
  args
  // (
    let
      inherit (args) lib namespace;
      inherit (lib.${namespace}) chezmoi;
    in
    {
      confs = {
        "settings/chezmoi/surface-debian/dot_bashrc.tmpl" = chezmoi.".bashrc";
        "settings/chezmoi/surface-void/dot_bashrc.tmpl" = chezmoi.".bashrc";
      };
    }
  )
)
