{ pulseaudio, pog, ... }:
pog.pog {
  name = "roc-switch";
  version = "0.1.0";
  description = "A script for roc";

  runtimeInputs = [ pulseaudio ];

  flags = [
    {
      name = "on";
      description = "turn roc on";
      bool = true;
    }
    {
      name = "off";
      short = "f";
      description = "turn roc off";
      bool = true;
    }
  ];

  script =
    helpers: with helpers; ''
      get_sink_id() {
        id="$(pactl list sinks short | grep "$1" | cut -f 1)"
        echo "$id"
      }

      if ${flag "on"}; then
        roc="$(get_sink_id roc-sink)"
        pactl set-default-sink "$roc"
      elif ${flag "off"}; then
        speak="$(get_sink_id analog-stereo)"
        pactl set-default-sink "$speak"
      else
        help
      fi
    '';
}
