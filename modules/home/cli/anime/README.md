# cli anime

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
```

## adl

Popcorn anime scraper/downloader + trackma wrapper.
[github](https://github.com/RaitaroH/adl)
`$ adl --help`

```
Version: 3.2.8
Wrapper for anime-downloader. Allows using watchlist given by trackma for a better anime watching cli experience.
Homepage: https://github.com/RaitaroH/adl
Usage: $adl [Option...] [Argument...]
Options:
  -p, --player      Define player used for streaming. Ex: $adl -p mpv;
  -s, --show        Watch custom show. Ep nr optional, careful with the quotes. Ex: $adl -s "gegege 2018";
  -n, --number      Specify episode number that will be used with '-s / --show' option. Ex: $adl -s "gegege 2018" -n "4";
  -y, --no-confirm  Assume default option for all promts, except watch another anime. Requires anime-downloader git/master;
  -r, --retrieve    Run trackma retrieve to update local list;
  -d, --download    Download instead of streaming; specify save folder (will be ignored if you changed animdl config.yml);
  -l, --local       Use local files instead of streaming. Define folder to be used for local as argument; Overrides -d;
  -f, --frece       Optionally adl can use frece to show most watched anime at the top of the list in fzf;
  -a, --account     By default trackma will use account 1. Use $adl -a "2" for example to change trackma account;
  -q, --query       By default trackma will list watching. Use $adl -q "query" to change the list.
                    Available queries: watching, completed, rewatching, paused, dropped, plantowatch;
  -u, --update      Update this script from github master;
  -c, --cover       Show cover/artwork image during anime selction, using ueberzug; use at your own risk;
  -g, --debug       Enter light debug mode; Use $set -x adl -g ... for full debug mode;
  -h, --help        Display help and exit;
  -v, --version     Display version and exit.
```

```nix tangle:default.nix
      "adl"
```

## ani-cli

Cli tool to browse and play anime.
[github](https://github.com/pystardust/ani-cli)
`$ ani-cli --help`

```
    Usage:
    .ani-cli-wrapped [options] [query]
    .ani-cli-wrapped [query] [options]
    .ani-cli-wrapped [options] [query] [options]

    Options:
      -c, --continue
        Continue watching from history
      -d, --download
        Download the video instead of playing it
      -D, --delete
        Delete history
      -l, --logview
        Show logs
      -s, --syncplay
        Use Syncplay to watch with friends
      -S, --select-nth
        Select nth entry
      -q, --quality
        Specify the video quality
      -v, --vlc
        Use VLC to play the video
      -V, --version
        Show the version of the script
      -h, --help
        Show this help message and exit
      -e, --episode, -r, --range
        Specify the number of episodes to watch
      --dub
        Play dubbed version
      --rofi
        Use rofi instead of fzf for the interactive menu
      --skip
        Use ani-skip to skip the intro of the episode (mpv only)
      --no-detach
        Don't detach the player (useful for in-terminal playback, mpv only)
      --exit-after-play
        Exit the player, and return the player exit code (useful for non interactive scenarios, works only if --no-detach is used, mpv only)
      --skip-title <title>
        Use given title as ani-skip query
      -N, --nextep-countdown
        Display a countdown to the next episode
      -U, --update
        Update the script
    Some example usages:
      .ani-cli-wrapped -q 720p banana fish
      .ani-cli-wrapped --skip --skip-title "one piece" -S 2 one piece
      .ani-cli-wrapped -d -e 2 cyberpunk edgerunners
      .ani-cli-wrapped --vlc cyberpunk edgerunners -q 1080p -e 4
      .ani-cli-wrapped blue lock -e 5-6
      .ani-cli-wrapped -e "5 6" blue lock

```

## ani-skip

Automated solution to bypassing anime opening and ending sequences.
[github](https://github.com/synacktraa/ani-skip)
`$ ani-skip --help`

```
    Usage:
    .ani-skip-wrapped [OPTIONS]

    Options:
      -q, --query
        Anime Title or MyAnimeList ID
      -e, --episode
        Specify the episode number
      -V, --version
        Show the version of the script
      -h, --help
        Show this help message and exit
      -U, --update
        Update the script
    Some example usages:
      .ani-skip-wrapped -q "Solo Leveling" # Returns MyAnimeList ID
      .ani-skip-wrapped -q "Solo Leveling" -e 3 # Returns MPV skip flag
      .ani-skip-wrapped -q 52299 -e 5 # Returns MPV skip flag

```

```nix tangle:default.nix
      "ani-skip"
```

## animdl

Highly efficient, powerful and fast anime scraper.
[github](https://github.com/justfoolingaround/animdl)
`$ animdl --help`

```
Usage: animdl [OPTIONS] COMMAND [ARGS]...

Options:
  --version             Show the version and exit.
  -x, --disable-update  Disable update check.
  --help                Show this message and exit.

Commands:
  download  Download your favorite anime by query.
  grab      Stream the stream links to the stdout stream for external usage.
  schedule  Know which animes are going over the air when.
  search    Search for an anime in the provider.
  stream    Stream your favorite anime by query.
  update    Update the project or git pull if a repository.
```

```nix tangle:default.nix
      "animdl"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
```

## fast-anime

Your browser anime experience from the terminal.
[github](https://github.com/Benex254/FastAnime)
`$ fastanime --help`

```
Usage: fastanime [OPTIONS] COMMAND [ARGS]...

  A command line application for streaming anime that provides a complete and
  featureful interface

Options:
  --version                       Show the version and exit.
  -m, --manga                     Enable manga mode
  --log                           Allow logging to stdout
  --log-file                      Allow logging to a file
  --rich-traceback                Use rich to output tracebacks
  -p, --provider [allanime|animepahe|hianime|nyaa|yugen]
                                  Provider of your choice
  -s, --server [sharepoint|dropbox|gogoanime|weTransfer|wixmp|Yt|mp4-upload|kwik|HD1|HD2|StreamSB|StreamTape|top]
                                  Server of choice
  -f, --format TEXT               yt-dlp format to use
  -c, --continue / -no-c, --no-continue
                                  Continue from last episode?
  --local-history / --remote-history
                                  Whether to continue from local history or
                                  remote history
  --skip / --no-skip              Skip opening and ending theme songs?
  -q, --quality [360|480|720|1080]
                                  set the quality of the stream
  -t, --translation-type [dub|sub]
                                  Anime language[dub/sub]
  -sl, --sub-lang TEXT            Set the preferred language for subs
  -A, --auto-next / -no-A, --no-auto-next
                                  Auto select next episode?
  -a, --auto-select / -no-a, --no-auto-select
                                  Auto select anime title?
  --normalize-titles / --no-normalize-titles
                                  whether to normalize anime and episode titls
                                  given by providers
  -d, --downloads-dir PATH        Downloads location
  --fzf                           Use fzf for the ui
  --default                       Use the default interface
  --preview                       Show preview when using fzf
  --no-preview                    Dont show preview when using fzf
  --icons / --no-icons            Use icons in the interfaces
  --dub                           Set the translation type to dub
  --sub                           Set the translation type to sub
  --rofi                          Use rofi for the ui
  --rofi-theme PATH               Rofi theme to use
  --rofi-theme-preview PATH       Rofi theme to use for previews
  --rofi-theme-confirm PATH       Rofi theme to use for the confirm prompt
  --rofi-theme-input PATH         Rofi theme to use for the user input prompt
  --use-python-mpv / --use-default-player
                                  Whether to use python-mpv
  -sp, --sync-play                Use sync play
  -P, --player [mpv|vlc]          the player to use when streaming
  --fresh-requests                Force the requests cache to be updated
  --no-config                     Don't load the user config
  --help                          Show this message and exit.

Commands:
  anilist      Access all streaming options
  cache        Helper command to manage cache
  completions  Helper command to get shell completions
  config       Edit your config
  download     Download anime
  downloads    Watch downloads
  grab         Print anime streams to standard out
  search       Binge anime
  serve        Command that automates the starting of the builtin...
  update       Helper command to update fastanime to latest

  Examples:
    # example of syncplay intergration
    fastanime --sync-play --server sharepoint search -t <anime-title>
  
    # --- or ---
  
    # to watch with anilist intergration
    fastanime --sync-play --server sharepoint anilist
  
    # downloading dubbed anime
    fastanime --dub download -t <anime>
  
    # use  icons and fzf for a more elegant ui with preview
    fastanime --icons --preview --fzf anilist
  
    # use icons with default ui
    fastanime --icons --default anilist
  
    # viewing manga
    fastanime --manga search -t <manga-title>
```

```nix tangle:default.nix
      "fast-anime"
```

## lobster

CLI to watch Movies/TV Shows from the terminal
[github](https://github.com/justchokingaround/lobster)
`$ lobster --help`

```
  Usage: .lobster-wrapped [options] [query]
  If a query is provided, it will be used to search for a Movie/TV Show

  Options:
    -c, --continue
      Continue watching from current history
    -d, --download [path]
      Downloads movie or episode that is selected (if no path is provided, it defaults to the current directory)
    --discord, --discord-presence, --rpc, --presence
      Enables discord rich presence (beta feature, but should work fine on Linux)
    -e, --edit
      Edit config file using an editor defined with lobster_editor in the config ($EDITOR by default)
    -h, --help
      Show this help message and exit
    -i, --image-preview
      Shows image previews during media selection (requires chafa, you can optionally use ueberzugpp)
    -j, --json
      Outputs the json containing video links, subtitle links, referrers etc. to stdout
    -l, --language [language]
      Specify the subtitle language (if no language is provided, it defaults to english)
    --rofi, --external-menu
      Use rofi instead of fzf
    -p, --provider
      Specify the provider to watch from (if no provider is provided, it defaults to Vidcloud) (currently supported: Vidcloud, UpCloud)
    -q, --quality
      Specify the video quality (if no quality is provided, it defaults to 1080)
    -r, --recent [movies|tv]
      Lets you select from the most recent movies or tv shows (if no argument is provided, it defaults to movies)
    -s, --syncplay
      Use Syncplay to watch with friends
    -t, --trending
      Lets you select from the most popular movies and shows
    -u, -U, --update
      Update the script
    -v, -V, --version
      Show the version of the script
    -x, --debug
      Enable debug mode (prints out debug info to stdout and also saves it to /tmp/lobster.log)

  Note:
    All arguments can be specified in the config file as well.
    If an argument is specified in both the config file and the command line, the command line argument will be used.

  Some example usages:
    .lobster-wrapped -i a silent voice --rofi
    .lobster-wrapped -l spanish -q 720 fight club -i -d
    .lobster-wrapped -l spanish blade runner --json

```

```nix tangle:default.nix
      "lobster"
```

## sauce

A novelty CLI tool for all your anime source needs.
[github](https://github.com/cadecuddy/sauce)
`$ sauce --help`

```
🥫 sauce is a CLI tool to find the source of anime screenshots, gifs, clips, etc.

Usage:
  sauce [command] <file path/link>

Available Commands:
  file        Search using a path to local file.
  url         Search using a url to media.
  help        Help about any command.

Use "sauce [command] --help" for more information about a command.
```

```nix tangle:default.nix
      "sauce"
```

## toru

Bittorrent streaming CLI tool. Stream anime torrents, real-time with no waiting for downloads
[github](https://github.com/sweetbbak/toru)
`$ toru --help`

```
Usage:
  toru [OPTIONS] <command>

Application Options:
  -v, --verbose       Verbose output
  -V, --version       display version info and exit
  -4, --ipv4          use IPV4 instead of IPV6
  -p, --player=       set a custom video player. Use {url} as a placeholder if
                      the url is not the last argument in the string
  -P, --port=         set the port that torrents are streamed over (default:
                      8888)
  -x, --proxy=        use a proxy URL like nyaa.iss.ink
  -T, --torrent-port= set the port that the torrent client will use to talk to
                      peers (default: -1)

Help Options:
  -h, --help          Show this help message

Available commands:
  download  select one or many torrents to download (aliases: dl, d)
  init      source zsh or bash completions
  latest    get the latest anime
  run       run an interactive terminal session (aliases: r)
  search    search torrents and output them in a given format (aliases: se, q)
  stream    stream torrents (aliases: s, play)
  version   print version and debugging info
  wget      wget a torrent file

```

```nix tangle:default.nix
      "toru"
      # keep-sorted end
    ];
```

## trackma

Open multi-site list manager for Unix-like systems (ex-wMAL).
[github](https://github.com/z411/trackma)

```nix tangle:default.nix
    enable = "trackma";
  }
)
```
