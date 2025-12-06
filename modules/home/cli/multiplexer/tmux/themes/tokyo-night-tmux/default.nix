args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        host
        namespace
        lib
        ;
      inherit (lib.${namespace}.settings) laptops;
      isLaptop = builtins.elem host laptops;
      battery = if isLaptop then "1" else "0";
    in
    {
      progs.tmux.plugins = [
        {
          plugin = pkgs.tmuxPlugins.tokyo-night-tmux;
          extraConfig = ''
            set -g @tokyo-night-tmux_theme storm    # storm | day | default to 'night'
            set -g @tokyo-night-tmux_transparent 1  # 1 or 0
            set -g @tokyo-night-tmux_show_music 1

            set -g @tokyo-night-tmux_show_battery_widget ${battery}
            set -g @tokyo-night-tmux_battery_name "BAT1"  # some linux distro have 'BAT0'
            set -g @tokyo-night-tmux_battery_low_threshold 21 # default

            set -g @tokyo-night-tmux_time_format 24H

            set -g status-position top
          '';
        }
      ];
    }
  )
)
