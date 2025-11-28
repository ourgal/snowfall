args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        disabled
        enabled
        namespace
        ;
    in
    {
      # copy from ~/.local/share/fcitx5/rime/build/sbfm.schema.yaml
      dataFiles."fcitx5/rime/sbfm.custom.yaml" = {
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
            {
              name = "ascii_punct";
              reset = 0;
              states = [
                "。，"
                "．，"
              ];
            }
            {
              name = "zh_trad";
              reset = 0;
              states = [
                "简体"
                "繁体"
              ];
            }
            {
              options = [
                "pro_word"
                "pro_char"
                "delayed_pop"
              ];
              reset = 0;
              states = [
                "词组"
                "单字"
                "延顶"
              ];
            }
            {
              name = "is_enhanced";
              reset = 0;
              states = [
                "常规"
                "增强"
              ];
            }
            {
              options = [
                "hide"
                "rational"
                "irrational"
                "both"
              ];
              reset = 1;
              states = [
                "隐藏"
                "有理"
                "无理"
                "两者"
              ];
            }
            {
              name = "auto_inline";
              reset = 1;
            }
            {
              name = "is_buffered";
              reset = 0;
            }
            {
              name = "single_display";
              reset = 0;
            }
            {
              name = "third_pop";
              reset = 0;
            }
            {
              name = "fast_pop";
              reset = 0;
            }
          ];
          key_binder = {
            import_preset = "sbxlm";
            bindings = [
              {
                accept = "Shift+space";
                toggle = "ascii_mode";
                when = "always";
              }
            ];
          };
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
      value = {
        catppuccin.fcitx5 = disabled;
        i18n.inputMethod = enabled // {
          type = "fcitx5";
          fcitx5 = {
            settings.inputMethod = {
              GroupOrder."0" = "Default";
              "Groups/0" = {
                Name = "Default";
                "Default Layout" = "us";
                DefaultIM = "rime";
              };
              "Groups/0/Items/0".Name = "rime";
              "Groups/0/Items/1".Name = "keyboard-us";
            };
            addons = with pkgs; [
              (fcitx5-rime.override { rimeDataPkgs = [ pkgs.${namespace}.sbsrf-rime-data ]; })
              fcitx5-nord
              fcitx5-mozc
              fcitx5-tokyonight
              fcitx5-rose-pine
              fcitx5-configtool
              fcitx5-material-color
            ];
          };
        };
      };
    }
  )
)
