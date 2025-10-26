args:
args.module (
  args
  // (
    let
      inherit (args) host;
    in
    {
      value = {
        home.file = {
          ".xprofile".text =
            if (host == "surface") then
              "xrandr --output eDP-1 --mode 2736x1824"
            else if (host == "home") then
              "xrandr --output DVI-D-0 --auto --pos 0x0 --primary --output HDMI-0 --auto --pos 1920x0"
            else
              "";
        };
      };
    }
  )
)
