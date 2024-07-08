{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    dataFiles = {
      "fcitx5/rime" = [
        ./default.custom.yaml
        ./sbfm.custom.yaml
      ];
    };
    value = with args; {
      i18n.inputMethod = {
        enabled = "fcitx5";
        fcitx5.addons = [ pkgs.fcitx5-rime ];
      };
    };
  }
)
