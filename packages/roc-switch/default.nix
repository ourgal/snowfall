{
  writeShellApplication,
  lib,
  pulseaudio,
  ...
}:
writeShellApplication rec {
  name = "roc-switch";

  meta = {
    mainProgram = name;
    platforms = lib.platforms.linux;
  };

  runtimeInputs = [ pulseaudio ];

  text = ''
    function get_sink_id() {
      id="$(pactl list sinks short | grep "$1" | cut -f 1)"
      echo "$id"
    }

    function speak_on() {
      speak="$(get_sink_id analog-stereo)"
      pactl set-default-sink "$speak"
    }

    function roc_on() {
      roc="$(get_sink_id roc-sink)"
      pactl set-default-sink "$roc"
    }

    function help() {
      echo "use roc-switch on or roc-switch off"
    }

    case "$1" in
    "on")
      roc_on
      ;;
    "off")
      speak_on
      ;;
    *)
      help
      ;;
    esac
  '';
}
