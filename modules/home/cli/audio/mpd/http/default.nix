{
  path = ./.;
  servs.mpd.extraConfig = ''
    audio_output {
        type        "httpd"
        name        "My HTTP Stream"
        encoder     "opus"      # optional
        port        "8000"
        # quality   "5.0"       # do not define if bitrate is defined
        bitrate     "128000"    # do not define if quality is defined
        format      "48000:16:1"
        always_on   "yes"       # prevent MPD from disconnecting all listeners when playback is stopped.
        tags        "yes"       # httpd supports sending tags to listening streams.
    }
  '';
}
