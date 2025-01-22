# cli audio

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
```

## code-radio-cli

A command line music radio client for https://coderadio.freecodecamp.org, written in Rust.
[github](https://github.com/JasonWei512/code-radio-cli)
`$ code-radio --help`

```
code-radio-cli 1.0.5
Jason Wei
A command line music radio client for https://coderadio.freecodecamp.org
GitHub: https://github.com/JasonWei512/code-radio-cli

USAGE:
    code-radio [OPTIONS]

OPTIONS:
    -h, --help               Print help information
    -n, --no-logo            Do not display logo
    -s, --select-station     Manually select a station
    -v, --volume <VOLUME>    Volume, between 0 and 9 [default: 9]
    -V, --version            Print version information
```

```nix tangle:default.nix
      "code-radio-cli"
```

## radio-go-go

Go-powered CLI to surf global radio waves via a sleek TUI. Tune in & let's Go.
[github](https://github.com/matteo-pacini/RadioGoGo)

```nix tangle:default.nix
      "radio-go-go"
```

## roc-switch

A script for switching roc sink.
`$ roc-switch --help`

```
  Usage: roc-switch [-o|--on] [-f|--off]

  A script for roc

  Flags:
  -o, --on            	turn roc on [bool]
  -f, --off           	turn roc off [bool]
  -h, --help          	print this help and exit
  -v, --verbose       	enable verbose logging and info
  --no-color          	disable color and other formatting
```

```nix tangle:default.nix
      "roc-switch"
```

## sonicradio

A TUI radio player making use of Radio Browser API and Bubbletea.
[github](https://github.com/dancnb/sonicradio)
`$ sonicradio --help`

```nix tangle:default.nix
      "sonicradio"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
```

## espeak

Open source speech synthesizer that supports over 70 languages, based on eSpeak.
[github](https://github.com/espeak-ng/espeak-ng)
`$ espeak --help`

```
eSpeak NG text-to-speech: 1.51.1  Data at: /nix/store/3q4sf5p3n4f3p4rsqh27fxcjj21gayck-espeak-ng-1.51.1/share/espeak-ng-data

espeak-ng [options] ["<words>"]

-f <text file>   Text file to speak
--stdin    Read text input from stdin at once till to the end of a stream.

If neither -f nor --stdin are provided, then <words> from arguments are spoken,
or text is spoken from stdin, read separately one line by line at a time.

-a <integer>
	   Amplitude, 0 to 200, default is 100
-d <device>
	   Use the specified device to speak the audio on. If not specified, the
	   default audio device is used.
-g <integer>
	   Word gap. Pause between words, units of 10mS at the default speed
-k <integer>
	   Indicate capital letters with: 1=sound, 2=the word "capitals",
	   higher values indicate a pitch increase (try -k20).
-l <integer>
	   Line length. If not zero (which is the default), consider
	   lines less than this length as end-of-clause
-p <integer>
	   Pitch adjustment, 0 to 99, default is 50
-s <integer>
	   Speed in approximate words per minute. The default is 175
-v <voice name>
	   Use voice file of this name from espeak-ng-data/voices
-w <wave file name>
	   Write speech to this WAV file, rather than speaking it directly
-b	   Input text encoding, 1=UTF8, 2=8 bit, 4=16 bit
-m	   Interpret SSML markup, and ignore other < > tags
-q	   Quiet, don't produce any speech (may be useful with -x)
-x	   Write phoneme mnemonics to stdout
-X	   Write phonemes mnemonics and translation trace to stdout
-z	   No final sentence pause at the end of the text
--compile=<voice name>
	   Compile pronunciation rules and dictionary from the current
	   directory. <voice name> specifies the language
--compile-debug=<voice name>
	   Compile pronunciation rules and dictionary from the current
	   directory, including line numbers for use with -X.
	   <voice name> specifies the language
--compile-mbrola=<voice name>
	   Compile an MBROLA voice
--compile-intonations
	   Compile the intonation data
--compile-phonemes=<phsource-dir>
	   Compile the phoneme data using <phsource-dir> or the default phsource directory
--ipa      Write phonemes to stdout using International Phonetic Alphabet
--path="<path>"
	   Specifies the directory containing the espeak-ng-data directory
--pho      Write mbrola phoneme data (.pho) to stdout or to the file in --phonout
--phonout="<filename>"
	   Write phoneme output from -x -X --ipa and --pho to this file
--punct="<characters>"
	   Speak the names of punctuation characters during speaking.  If
	   =<characters> is omitted, all punctuation is spoken.
--sep=<character>
	   Separate phonemes (from -x --ipa) with <character>.
	   Default is space, z means ZWJN character.
--split=<minutes>
	   Starts a new WAV file every <minutes>.  Used with -w
--stdout   Write speech output to stdout
--tie=<character>
	   Use a tie character within multi-letter phoneme names.
	   Default is U+361, z means ZWJ character.
--version  Shows version number and date, and location of espeak-ng-data
--voices=<language>
	   List the available voices for the specified language.
	   If <language> is omitted, then list all voices.
--load     Load voice from a file in current directory by name.
-h, --help Show this help.
```

```nix tangle:default.nix
      "espeak"
```

## id3v2

Command line editor for id3v2 tags.
[github](https://id3v2.sourceforge.net/)
`$ id3v2 --help`

```
Usage: id3v2 [OPTION]... [FILE]...
Adds/Modifies/Removes/Views id3v2 tags, modifies/converts/lists id3v1 tags

  -h,  --help               Display this help and exit
  -f,  --list-frames        Display all possible frames for id3v2
  -L,  --list-genres        Lists all id3v1 genres
  -v,  --version            Display version information and exit
  -l,  --list               Lists the tag(s) on the file(s)
  -d,  --delete-v2          Deletes id3v2 tags
  -s,  --delete-v1          Deletes id3v1 tags
  -D,  --delete-all         Deletes both id3v1 and id3v2 tags
  -C,  --convert            Converts id3v1 tag to id3v2
  -1,  --id3v1-only         Writes only id3v1 tag
  -2,  --id3v2-only         Writes only id3v2 tag
  -r,  --remove-frame "FRAMEID"   Removes the specified id3v2 frame
  -a,  --artist       "ARTIST"    Set the artist information
  -A,  --album        "ALBUM"     Set the album title information
  -t,  --song         "SONG"      Set the song title information
  -c,  --comment      "DESCRIPTION":"COMMENT":"LANGUAGE"
                            Set the comment information (both
                            description and language optional)
  -g,  --genre   num        Set the genre number
  -y,  --year    num        Set the year
  -T,  --track   num/num    Set the track number/(optional) total tracks

You can set the value for any id3v2 frame by using '--' and then frame id
For example:
        id3v2 --TIT3 "Monkey!" file.mp3
would set the "Subtitle/Description" frame to "Monkey!".

```

```nix tangle:default.nix
      "id3v2"
```

## lame

High quality MPEG Audio Layer III (MP3) encoder.
[github](http://lame.sourceforge.net/)
`$ lame --help`

```
LAME 64bits version 3.100 (http://lame.sf.net)

usage: lame [options] <infile> [outfile]

    <infile> and/or <outfile> can be "-", which means stdin/stdout.

RECOMMENDED:
    lame -V2 input.wav output.mp3

OPTIONS:
    -b bitrate      set the bitrate, default 128 kbps
    -h              higher quality, but a little slower.
    -f              fast mode (lower quality)
    -V n            quality setting for VBR.  default n=4
                    0=high quality,bigger files. 9.999=smaller files
    --preset type   type must be "medium", "standard", "extreme", "insane",
                    or a value for an average desired bitrate and depending
                    on the value specified, appropriate quality settings will
                    be used.
                    "--preset help" gives more info on these

    --help id3      ID3 tagging related options

    --longhelp      full list of options

    --license       print License information

```

```nix tangle:default.nix
      "lame"
```

## normalize

Audio file normalizer.
[github](https://www.nongnu.org/normalize/)
`$ normalize --help`

```
Usage: normalize [OPTION]... [FILE]...
Normalize volume of multiple audio files

  -a, --amplitude=AMP          normalize the volume to the target amplitude
                                 AMP [default -12dBFS]
  -b, --batch                  batch mode: get average of all levels, and
                                 use one adjustment, based on the average
                                 level, for all files
      --clipping               turn off limiter; do clipping instead
      --fractions              display levels as fractions of maximum
                                 amplitude instead of decibels
  -g, --gain=ADJ               don't compute levels, just apply adjustment
                                 ADJ to the files.  Use the suffix "dB"
                                 to indicate a gain in decibels.
  -l, --limiter=LEV            limit all samples above LEV [default -6dBFS]
  -m, --mix                    mix mode: get average of all levels, and
                                 normalize volume of each file to the
                                 average
  -n, --no-adjust              compute and display the volume adjustment,
                                 but don't apply it to any of the files
      --peak                   adjust by peak level instead of using
                                 loudness analysis
  -q, --quiet                  quiet (decrease verbosity to zero)
  -t, --average-threshold=T    when computing average level, ignore any
                                 levels more than T decibels from average
  -T, --adjust-threshold=T     don't bother applying any adjustment smaller
                                 than T decibels
  -v, --verbose                increase verbosity
  -w, --output-bitwidth=W      force adjusted files to have W-bit samples

  -V, --version                display version information and exit
  -h, --help                   display this help and exit

Report bugs to <chrisvaill@gmail.com>.
```

```nix tangle:default.nix
      "normalize"
```

## openai-whisper-cpp

Port of OpenAI's Whisper model in C/C++.
[github](https://github.com/ggerganov/whisper.cpp)

```nix tangle:default.nix
      "openai-whisper-cpp"
```

## pamixer

Pulseaudio command line mixer.
[github](https://github.com/cdemoulins/pamixer)
`$ pamixer --help`

```
pulseaudio command line mixer
Usage:
  pamixer [OPTION...]

  -h, --help              help message
  -v, --version           print version info
      --sink arg          choose a different sink than the default
      --source arg        choose a different source than the default
      --default-source    select the default source
      --get-volume        get the current volume
      --get-volume-human  get the current volume percentage or the string
                          "muted"
      --set-volume arg    set the volume
  -i, --increase arg      increase the volume
  -d, --decrease arg      decrease the volume
  -t, --toggle-mute       switch between mute and unmute
  -m, --mute              set mute
      --allow-boost       allow volume to go above 100%
      --set-limit arg     set a limit for the volume
      --gamma arg         increase/decrease using gamma correction e.g. 2.2
                          (default: 1.0)
  -u, --unmute            unset mute
      --get-mute          display true if the volume is mute, false
                          otherwise
      --list-sinks        list the sinks
      --list-sources      list the sources
      --get-default-sink  print the default sink

```

```nix tangle:default.nix
      "pamixer"
```

## pulsemixer

Cli and curses mixer for pulseaudio.
[github](https://github.com/GeorgeFilipkin/pulsemixer)
`$ pulsemixer --help`

```
Usage of pulsemixer:
  -h, --help            show this help message and exit
  -v, --version         print version
  -l, --list            list everything
  --list-sources        list sources
  --list-sinks          list sinks
  --id ID               specify ID, default sink is used if no ID specified
  --get-volume          get volume for ID
  --set-volume n        set volume for ID
  --set-volume-all n:n  set volume for ID, for every channel
  --change-volume +-n   change volume for ID
  --max-volume n        set volume to n if volume is higher than n
  --get-mute            get mute for ID
  --mute                mute ID
  --unmute              unmute ID
  --toggle-mute         toggle mute for ID
  --server              choose the server to connect to
  --color n             0 no color, 1 color currently selected, 2 full-color
  --no-mouse            disable mouse support
  --create-config       generate configuration file
```

```nix tangle:default.nix
      "pulsemixer"
```

## scope-tui

Simple oscilloscope/vectorscope/spectroscope for your terminal.
[github](https://github.com/alemidev/scope-tui)
`$ scope-tui --help`

```
scope-tui 0.3.0 -- by alemi <me@alemi.dev>
A simple oscilloscope/vectorscope/spectroscope for your terminal

Usage: scope-tui [OPTIONS] <COMMAND>

Commands:
  pulse  use PulseAudio Simple api to read data from an audio sink
  file   use a file from filesystem and read its content
  audio  use new experimental CPAL backend
  help   Print this message or the help of the given subcommand(s)

Options:
      --channels <N>      number of channels to open [default: 2]
  -b, --buffer <SIZE>     size of audio buffer, and width of scope [default: 2048]
      --sample-rate <HZ>  sample rate to use [default: 48000]
      --tune <NOTE>       tune buffer size to be in tune with given note (overrides buffer option)
  -s, --scale <x>         floating point vertical scale, from 0 to 1 [default: 1]
      --scatter           use vintage looking scatter mode instead of line mode
      --no-reference      don't draw reference line
      --no-ui             hide UI and only draw waveforms
      --no-braille        don't use braille dots for drawing lines
  -h, --help              Print help
  -V, --version           Print version
```

```nix tangle:default.nix
      "scope-tui"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
```

## beets

Music tagger and library organizer.
[official site](https://beets.io/)
`$ beet --help`

```
Usage:
  beet COMMAND [ARGS...]
  beet help COMMAND

Options:
  --format-item=FORMAT_ITEM
                        print with custom format
  --format-album=FORMAT_ALBUM
                        print with custom format
  -l LIBRARY, --library=LIBRARY
                        library database file to use
  -d DIRECTORY, --directory=DIRECTORY
                        destination music directory
  -v, --verbose         log more details (use twice for even more)
  -c CONFIG, --config=CONFIG
                        path to configuration file
  -p PLUGINS, --plugins=PLUGINS
                        a comma-separated list of plugins to load
  -P EXCLUDE, --disable-plugins=EXCLUDE
                        a comma-separated list of plugins to disable
  -h, --help            show this help message and exit

Commands:
  clearart          remove images from file metadata
  config            show or edit the user configuration
  convert           convert to external location
  embedart          embed image files into file metadata
  extractart        extract an image from file metadata
  fetchart          download album art
  fields            show fields available for queries and format strings
  fingerprint       generate fingerprints for items without them
  fish              generate Fish shell tab completions
  help (?)          give detailed help on a specific sub-command
  import (imp, im)  import new music
  list (ls)         query the library
  lyrics            fetch song lyrics
  modify (mod)      change metadata fields
  move (mv)         move or copy items
  remove (rm)       remove matching items from the library
  stats             show statistics about the library or a query
  submit            submit Acoustid fingerprints
  update (upd, up)  update the library
  version           output version information
  write             write tag information to files
```

```nix tangle:default.nix
      "beets"
```

## cava

Console-based Audio Visualizer for Alsa.
[github](https://github.com/karlstav/cava)

```nix tangle:default.nix
      "cava"
```

## mpd

Flexible, powerful daemon for playing music.
[official site](https://www.musicpd.org/)
`$ mpd --help`

```
Usage:
  mpd [OPTION...] [path/to/mpd.conf]

Music Player Daemon - a daemon for playing music.

Options:
  --kill            kill the currently running mpd session
  --no-config       don't read from config
  --no-daemon       don't detach from console
  --systemd         systemd service mode
  --stderr          print messages to stderr
  -v, --verbose     verbose logging
  -V, --version     print version number
  -h, --help        show help options
```

```nix tangle:default.nix
      "mpd"
```

## pipewire

Server and user space API to deal with multimedia pipelines.
[official site](https://pipewire.org/)

```nix tangle:default.nix
      "pipewire"
```

## pyradio

Curses based internet radio player.
[github](http://www.coderholic.com/pyradio/)
`$ pyradio --help`

```
Usage: pyradio [-h] [-c CONFIG_DIR] [-p [STATION_NUMBER]] [-u PLAYER] [-l]
               [-lt] [-sds] [-sd] [-od] [-pc] [-d] [-ul] [-us] [-U] [-R] [-V]
               [-ls] [-s PLAYLIST] [-tlp] [-t THEME] [--show-themes]
               [--no-themes] [--write-theme IN_THEME OUT_THEME,]
               [--terminal TERMINAL] [--terminal-param TERMINAL_PARAM] [-oc]
               [-sc] [-cc] [-gc] [-r] [-or] [-lr] [-mkv MKV_FILE]
               [-scv PNG_FILE] [-srt] [-ach] [--headless IP_AND_PORT]
               [--address] [-fd]

Curses based Internet Radio Player

General options:
  -h, --help            Show this help message and exit
  -c CONFIG_DIR, --config-dir CONFIG_DIR
                        Use specified configuration directory instead of the
                        default one. PyRadio will try to create it, if it does
                        not exist. Not available on Windows.
  -p [STATION_NUMBER], --play [STATION_NUMBER]
                        Start and play.The value is num station or empty for
                        random.
  -u PLAYER, --use-player PLAYER
                        Use specified player. A comma-separated list can be
                        used to specify detection order. Supported players:
                        mpv, mplayer, vlc.
  -l, --list            List of available stations in a playlist.
  -lt, --log-titles     Log titles to file.
  -sds, --show-dirs     Print all the directories used by PyRadio and exit.
  -sd, --show-config-dir
                        Print config directory [CONFIG DIR] location and exit.
  -od, --open-config-dir
                        Open config directory [CONFIG DIR] with default file
                        manager.
  -pc, --print-config   Print PyRadio config.
  -d, --debug           Start PyRadio in debug mode.
  -ul, --unlock         Remove sessions' lock file.
  -us, --update-stations
                        Update "stations.csv" (if needed).
  -U, --update          Update PyRadio.
  -R, --uninstall       Uninstall PyRadio.
  -V, --version         Display version information.

Playlist selection:
  -ls, --list-playlists
                        List of available playlists in config dir.
  -s PLAYLIST, --stations PLAYLIST
                        Load the specified playlist instead of the default
                        one.
  -tlp, --toggle-load-last-playlist
                        Toggle autoload last opened playlist.

Themes:
  -t THEME, --theme THEME
                        Use specified theme.
  --show-themes         Show Internal and System Themes names.
  --no-themes           Disable themes (use default theme).
  --write-theme IN_THEME OUT_THEME,
                        Write an Internal or System Theme to themes directory.

Terminal selection:
  --terminal TERMINAL   Use this terminal for Desktop file instead of the
                        auto-detected one. Use "none" to reset to the default
                        terminal or "auto" to reset to the auto-detected one.
  --terminal-param TERMINAL_PARAM
                        Use this as PyRadio parameter in the Desktop File.
                        Please replace hyphens with underscores when passing
                        the parameter, for example: --terminal-param "_p 3 _t
                        light" (which will result to "pyradio -p 3 -t light").

Cache:
  -oc, --open-cache     Open the Cache folder.
  -sc, --show-cache     Show Cache contents.
  -cc, --clear-cache    Clear Cache contents.
  -gc, --get-cache      Download source code, keep it in the cache and exit.

Recording stations:
  -r, --record          Turn recording on (not available for VLC player on
                        Windows).
  -or, --open-recordings
                        Open the Recordings folder.
  -lr, --list-recordings
                        List recorded files.
  -mkv MKV_FILE, --mkv-file MKV_FILE
                        Specify a previously recorded MKV file to be used with
                        one of the following options. The MKV_FILE can either
                        be an absolute or a relative path, or a number
                        provided by the -lr command line paremater. If it is a
                        relative path, it should be found in the current or in
                        the Recordings directory.
  -scv PNG_FILE, --set-mkv-cover PNG_FILE
                        Add or change the cover image of a previously recorded
                        MKV file. PNG_FILE can either be an absolute or a
                        relative path. If relative, it should be found in the
                        current or in the Recordings directory.
  -srt, --export-srt    Export a previously recorded MKV file chapters to an
                        SRT file. The file produced will have the name of the
                        input file with the "mkv" extension replaced by "srt".
  -ach, --add-chapters  Add (or replace) chapter markers to a previously
                        recorded MKV file. The chapters file will be a SRT
                        file, much like the one produced by the previous
                        command line parameter.

Headless operation:
  --headless IP_AND_PORT
                        Start in headless mode. IP_AND_PORT can be a) auto
                        (use localhost:11111), b) localhost:XXXXX (access the
                        web server through localhost), c) lan:XXXXX (access
                        the web server through the LAN) or d) IP_ADDRESS:XXXX
                        (the IP_ADDRESS must be already assigned to one of the
                        network interfaces). XXXXX can be any port number
                        above 1025. Please make sure it is different than the
                        one set in the configuration file.
  --address             Show remote control server address.
  -fd, --free-dead-headless-server
                        Use this if your headless server has terminated
                        unexpectedly, and you cannot start a new one (you get
                        a message that it is already running).

```

```nix tangle:default.nix
      "pyradio"
      # keep-sorted end
    ];
  }
)
```
