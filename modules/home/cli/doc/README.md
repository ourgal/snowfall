# cli doc

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
```

## archwiki

Offline archwiki.
`$ archwiki --help`

```
  This is a bash script for quick archwiki search using arch-wiki-docs package.

  flags:
    -h: Displays This help menu
    -d: Sets disown flag to true. e.g 'archwiki -d'
        This will disown the process after opening the entry.
        Good for using a browser like firefox and chrome. (default is false)
        *(Not recomended for terminal browsers like w3m)
    -m: Sets the menu program. e.g 'archwiki -m "rofi -dmenu -i"'
                                   'archwiki -m "bemenu"'
        This program will be used to display list of wiki entry.
        default is (rofi -dmenu -i -p ArchWiki )
    -o: Sets the opener program. e.g 'archwiki -o firefox'
                                   'archwki -o w3m'
        This program will be used to open entry.
        default is (xdg-open)

    * Note make sure to use -h as last flag to get a preview of your choices in the help menu
```

```nix tangle:default.nix
      "archwiki"
```

## eg

Examples at the command line.
[github](https://pypi.org/project/eg/)
`$ eg --help`

```
usage: eg [-h] [-v] [-f CONFIG_FILE] [-e] [--examples-dir EXAMPLES_DIR]
          [-c CUSTOM_DIR] [-p PAGER_CMD] [-l] [--color] [-s] [--no-color]
          [program]

eg provides examples of common command usage.

positional arguments:
  program               The program for which to display examples.

options:
  -h, --help            show this help message and exit
  -v, --version         Display version information about eg
  -f CONFIG_FILE, --config-file CONFIG_FILE
                        Path to the .egrc file, if it is not in the default
                        location.
  -e, --edit            Edit the custom examples for the given command. If
                        editor-cmd is not set in your .egrc and $VISUAL and
                        $EDITOR are not set, prints a message and does
                        nothing.
  --examples-dir EXAMPLES_DIR
                        The location to the examples/ dir that ships with eg
  -c CUSTOM_DIR, --custom-dir CUSTOM_DIR
                        Path to a directory containing user-defined examples.
  -p PAGER_CMD, --pager-cmd PAGER_CMD
                        String literal that will be invoked to page output.
  -l, --list            Show all the programs with eg entries.
  --color               Colorize output.
  -s, --squeeze         Show fewer blank lines in output.
  --no-color            Do not colorize output.
```

```nix tangle:default.nix
      "eg"
```

## lib-x

A cli wrapper over calibredb.
[github](https://github.com/Benex254/lib-x)
`$ lib-x --help`

```
Usage: .lib-x-wrapped [arguments] [options]

Commandline options override the config
Some of the options are directly passed to calibredb

Options:
  -s, --search
    search for a book based on calibredb search syntax
  -S, --sort-by
    sort the books on a specified field
  -g, --go-directly-to
    open .lib-x-wrapped with a sub-menu pre-selected
  -e, --edit-config
    edit .lib-x-wrapped config file
  --rofi-theme <path>
    set the path to your rofi config file
  -d,--disown-reading-process
    disown the reading process so you can contine reading even if you close .lib-x-wrapped
  -D,--no-disown-reading-process
    don't disown the reading process hence when .lib-x-wrapped closes the app your using to read your book will also close
  -p <selector>,--preferred-selector <selector>
    set the preferred selector for .lib-x-wrapped to use
  --preview
    enable the preview window
  --no-preview
    disable the preview window
  -r <number>, --no-of-random-books <number>
    the number of random books to show; also makes the cli auto choose Random sub-menu
  -h, --help
    Show this help message and exit
  -v, --version
    print the .lib-x-wrapped version and exit

arguments:
  completions
    generates shell completions for .lib-x-wrapped

Examples:
  .lib-x-wrapped --search tag:chess --sort-by author
  .lib-x-wrapped --search tag:chess
  .lib-x-wrapped --sort-by size
  .lib-x-wrapped --go-directly-to Reading-List --sort-by size
  .lib-x-wrapped --go-directly-to Reading-List
  .lib-x-wrapped --no-of-random-books 50 --go-directly-to Random

  .lib-x-wrapped completions --fish
```

```nix tangle:default.nix
      "lib-x"
```

## qman

A more modern man page viewer for our terminals.
[github](https://github.com/plp13/qman)
`$ qman --help`

```
[?1002lUsage: qman [OPTION...] [SECTION] [PAGE]...

  -n, --index              Show all manual pages (default behaviour if no PAGE
                           has been specified)
  -k, --apropos            Show a list of all pages whose name and/or
                           description contains PAGE (apropos)
  -f, --whatis             Show a list of all pages whose name matches PAGE
                           (whatis)
  -l, --local-file         Interpret PAGE argument(s) as local filename(s)
  -K, --global-apropos     Show the contents of all pages whose name and/or
                           description contains PAGE (global apropos)
  -a, --all                Show the contents of all pages whose name matches
                           PAGE (global whatis)
  -T, --cli                Suppress the TUI and output directly to the terminal
  -C, --config-path=ARG    Use ARG as the configuration file path
  -h, --help               Display this help message

Mandatory or optional arguments to long options are also mandatory or optional
for any corresponding short options.
```

```nix tangle:default.nix
      "qman"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
```

## bk

Terminal epub reader written in rust.
[github](https://github.com/aeosynth/bk)
`$ bk --help`

```
Usage: bk [<path>] [--bg <bg>] [--fg <fg>] [-m] [-t] [-w <width>]

read a book

Options:
  --bg              background color (eg 282a36)
  --fg              foreground color (eg f8f8f2)
  -m, --meta        print metadata and exit
  -t, --toc         start with table of contents open
  -w, --width       characters per line
  --help            display usage information

```

```nix tangle:default.nix
      "bk"
```

## cheat

Create and view interactive cheatsheets on the command-line.
[github](https://github.com/cheat/cheat)
`$ cheat --help`

```
Usage:
  cheat [options] [<cheatsheet>]

Options:
  --init                  Write a default config file to stdout
  -a --all                Search among all cheatpaths
  -c --colorize           Colorize output
  -d --directories        List cheatsheet directories
  -e --edit=<cheatsheet>  Edit <cheatsheet>
  -l --list               List cheatsheets
  -p --path=<name>        Return only sheets found on cheatpath <name>
  -r --regex              Treat search <phrase> as a regex
  -s --search=<phrase>    Search cheatsheets for <phrase>
  -t --tag=<tag>          Return only sheets matching <tag>
  -T --tags               List all tags in use
  -v --version            Print the version number
  --rm=<cheatsheet>       Remove (delete) <cheatsheet>
  --conf                  Display the config file path

Examples:

  To initialize a config file:
    mkdir -p ~/.config/cheat && cheat --init > ~/.config/cheat/conf.yml

  To view the tar cheatsheet:
    cheat tar

  To edit (or create) the foo cheatsheet:
    cheat -e foo

  To edit (or create) the foo/bar cheatsheet on the "work" cheatpath:
    cheat -p work -e foo/bar

  To view all cheatsheet directories:
    cheat -d

  To list all available cheatsheets:
    cheat -l

  To list all cheatsheets whose titles match "apt":
    cheat -l apt

  To list all tags in use:
    cheat -T

  To list available cheatsheets that are tagged as "personal":
    cheat -l -t personal

  To search for "ssh" among all cheatsheets, and colorize matches:
    cheat -c -s ssh

  To search (by regex) for cheatsheets that contain an IP address:
    cheat -c -r -s '(?:[0-9]{1,3}\.){3}[0-9]{1,3}'

  To remove (delete) the foo/bar cheatsheet:
    cheat --rm foo/bar

  To view the configuration file path:
    cheat --conf
```

```nix tangle:default.nix
      "cheat"
```

## dasht

Search API docs offline, in terminal or browser.
[github](https://sunaku.github.io/dasht/man)
`$ dasht --help`

```
--help                                              Python_3 option
--help-all                                          Python_3 option
--help-env                                          Python_3 option
--help-xoptions                                     Python_3 option
ast.--help                                          Python_3 option
calendar.--help                                     Python_3 option
dis.--help                                          Python_3 option
gzip.--help                                         Python_3 option
json.tool.--help                                    Python_3 option
python--m-sqlite3-[-h]-[-v]-[filename]-[sql].--help Python_3 option
random.--help                                       Python_3 option
timeit.--help                                       Python_3 option
tokenize.--help                                     Python_3 option
trace.--help                                        Python_3 option
uuid.--help                                         Python_3 option
zipapp.--help                                       Python_3 option

```

```nix tangle:default.nix
      "dasht"
```

## halp

CLI tool to get help with CLI tools.
[github](https://github.com/orhun/halp)
`$ halp --help`

```
A CLI tool to get help with CLI tools 🐙

Usage:
  halp [OPTIONS] <CMD>
  halp [OPTIONS] <COMMAND> <CMD>

Commands:
  plz  Get additional help

Arguments:
  <CMD>  Command or binary name

Options:
      --check <ARG>    Sets the argument to check
      --no-version     Disable checking the version information
      --no-help        Disable checking the help information
  -c, --config <PATH>  Sets the configuration file [env: HALP_CONFIG=]
  -v, --verbose        Enables verbose logging
  -h, --help           Print help
  -V, --version        Print version
```

```nix tangle:default.nix
      "halp"
      # keep-sorted end
    ];
```

## tealdeer

Very fast implementation of tldr in Rust.
[github](https://github.com/dbrgn/tealdeer)
`$ tldr --help`

```
tealdeer 1.7.0: A fast TLDR client
Danilo Bargen <mail@dbrgn.ch>, Niklas Mohrin <dev@niklasmohrin.de>

Usage: tldr [OPTIONS] [COMMAND]...

Arguments:
  [COMMAND]...  The command to show (e.g. `tar` or `git log`)

Options:
  -l, --list                 List all commands in the cache
  -f, --render <FILE>        Render a specific markdown file
  -p, --platform <PLATFORM>  Override the operating system, can be specified multiple times in order
                             of preference [possible values: linux, macos, sunos, windows, android,
                             freebsd, netbsd, openbsd]
  -L, --language <LANGUAGE>  Override the language
  -u, --update               Update the local cache
      --no-auto-update       If auto update is configured, disable it for this run
  -c, --clear-cache          Clear the local cache
      --pager                Use a pager to page output
  -r, --raw                  Display the raw markdown instead of rendering it
  -q, --quiet                Suppress informational messages
      --show-paths           Show file and directory paths used by tealdeer
      --seed-config          Create a basic config
      --color <WHEN>         Control whether to use color [possible values: always, auto, never]
  -v, --version              Print the version
  -h, --help                 Print help

To view the user documentation, please visit https://tealdeer-rs.github.io/tealdeer/.
```

```nix tangle:default.nix
    enable = "tealdeer";
  }
)
```
