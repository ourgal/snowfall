args:
args.module (
  args
  // (
    let
      inherit (args) pkgs enabled;
    in
    {
      path = ./.;
      dataFiles = {
        "fcitx5/rime/default.custom.yaml" = {
          patch = {
            schema_list = [ { schema = "sbfm"; } ];
            "key_binder/bindings" = [
              {
                accept = "Shift+space";
                toggle = "ascii_mode";
                when = "always";
              }
            ];
            ascii_composer = {
              good_old_caps_lock = false;
              switch_key = {
                Caps_Lock = "noop";
                Control_L = "noop";
                Control_R = "noop";
                Shift_L = "noop";
                Shift_R = "noop";
              };
            };
          };
        };
        "fcitx5/rime/sbfm.custom.yaml" = {
          patch = {
            switches = [
              {
                name = "ascii_mode";
                reset = 1;
                states = [
                  "中文"
                  "西文"
                ];
              }
            ];
            "key_binder/bindings" = [
              {
                accept = "Shift+space";
                toggle = "ascii_mode";
                when = "always";
              }
            ];
            ascii_composer = {
              good_old_caps_lock = false;
              switch_key = {
                Caps_Lock = "noop";
                Control_L = "noop";
                Control_R = "noop";
                Shift_L = "noop";
                Shift_R = "noop";
              };
            };
          };
        };
      };
      value = {
        catppuccin.fcitx5 = enabled;
        i18n.inputMethod = {
          enabled = "fcitx5";
          fcitx5 = {
            addons = with pkgs; [
              fcitx5-rime
              fcitx5-nord
              fcitx5-configtool
              fcitx5-material-color
            ];
          };
        };
      };
    }
  )
)
