# cli editor

```nix tangle:default.nix
args:
args.module (
  args
  // (
    let
      inherit (args) pkgs;
    in
    {
      path = ./.;
```

## lem

Common Lisp editor/IDE with high expansibility
[github](https://github.com/lem-project/lem)
`$ lem --help`

```
Usage: lem [ OPTION-OR-FILENAME ] ...
Options:
        -q, --no-init-file        do not load ~/.lem/init.lisp
        --slime PORT              start slime on PORT
        --eval EXPR               evaluate lisp expression EXPR
        --debug                   enable debugger
        --log-filename FILENAME   file name of the log file
        --kill                    immediately exit
        -i, --interface INTERFACE interface to use, either sdl2 or ncurses
        -v, --version             print the version number and exit
        -h, --help                display this help and exit
```

```nix tangle:default.nix
      inputPkgs = p: [ p.lem.packages."${pkgs.system}".default ];
```

## v

Z for vim
[github](https://github.com/rupa/v)
`$ v --help`

```
v [-a] [-c] [-l] [-[0-9]] [--debug] [--help] [regexes]
```

```nix tangle:default.nix
      myPkgs = "v";
      nixPkgs = [
        # keep-sorted start
```

## micro

Modern and intuitive terminal-based text editor
[official site](https://micro-editor.github.io/)
`$ micro --help`

```
Usage: micro [OPTIONS] [FILE]...
-clean
    	Cleans the configuration directory
-config-dir dir
    	Specify a custom location for the configuration directory
[FILE]:LINE:COL (if the `parsecursor` option is enabled)
+LINE:COL
    	Specify a line and column to start the cursor at when opening a buffer
-options
    	Show all option help
-debug
    	Enable debug mode (enables logging to ./log.txt)
-profile
    	Enable CPU profiling (writes profile info to ./micro.prof
    	so it can be analyzed later with "go tool pprof micro.prof")
-version
    	Show the version number and information

Micro's plugins can be managed at the command line with the following commands.
-plugin install [PLUGIN]...
    	Install plugin(s)
-plugin remove [PLUGIN]...
    	Remove plugin(s)
-plugin update [PLUGIN]...
    	Update plugin(s) (if no argument is given, updates all plugins)
-plugin search [PLUGIN]...
    	Search for a plugin
-plugin list
    	List installed plugins
-plugin available
    	List available plugins

Micro's options can also be set via command line arguments for quick
adjustments. For real configuration, please use the settings.json
file (see 'help options').

-option value
    	Set `option` to `value` for this session
    	For example: `micro -syntax off file.c`

Use `micro -options` to see the full list of configuration options
```

```nix tangle:default.nix
        "micro"
```

## ox

Independent Rust text editor that runs in your terminal
[github](https://github.com/curlpipe/ox)
`$ ox --help`

```
Ox: A lightweight and flexible text editor

USAGE: ox [options] [files]

OPTIONS:
  --help, -h                   : Show this help message
  --version, -v                : Show the version number
  --config [path], -c [path]   : Specify the configuration file
  --readonly, -r               : Prevent opened files from writing
  --filetype [name], -f [name] : Set the file type of files opened
  --stdin                      : Reads file from the stdin
  --config-assist              : Activate the configuration assistant

EXAMPLES:
  ox
  ox test.txt
  ox test.txt test2.txt
  ox /home/user/docs/test.txt
  ox -c config.lua test.txt
  ox -r -c ~/.config/.oxrc -f Lua my_file.lua
  tree | ox -r --stdin
  ox --config-assist
```

```nix tangle:default.nix
        "ox"
```

## vimer

A convenience wrapper for gvim/mvim --remote(-tab)-silent to open files in an existing instance of GVim or MacVim.
[github](https://github.com/susam/vimer)
`$ vimer --help`

```
Usage: vimer [-t] [-s] [-n] [-h] [-v] [-|FILE...]

This is a wrapper script to open files in existing GVim or MacVim.
If an existing instance of GVim or MacVim is running, the files are
opened in it, otherwise, a new GVim or MacVim instance is launched.
If no arguments are specified, a new GVim or MacVim instance is
launched.

If this script cannot find GVim or MacVim, set the VIM_CMD environment
variable with the command to execute GVim or MacVim as its value.

Arguments:
  -                  Read text from standard input.
  FILE...            Read text from one or more files.

Options:
  -t, --tab          Open each file in new tab.
  -s, --server NAME  Open files in GVim server with specified NAME.
  -n, --name         Show the name/path of GVim/MacVim being used.
  -h, --help         Show this help and exit.
  -v, --version      Show version and exit.

Report bugs to <https://github.com/susam/vimer/issues>.
```

```nix tangle:default.nix
        "vimer"
```

## vis

A vim like editor
[github](https://github.com/martanne/vis)

```nix tangle:default.nix
        "vis"
        # keep-sorted end
      ];
      enable = [
        # keep-sorted start
```

## helix

Post-modern modal text editor
[official site](https://helix-editor.com/)
`$ hx --help`

```
helix-term 24.7 (079f5442)
Blaž Hrastnik <blaz@mxxn.io>
A post-modern text editor.

USAGE:
    hx [FLAGS] [files]...

ARGS:
    <files>...    Sets the input file to use, position can also be specified via file[:row[:col]]

FLAGS:
    -h, --help                     Prints help information
    --tutor                        Loads the tutorial
    --health [CATEGORY]            Checks for potential errors in editor setup
                                   CATEGORY can be a language or one of 'clipboard', 'languages'
                                   or 'all'. 'all' is the default if not specified.
    -g, --grammar {fetch|build}    Fetches or builds tree-sitter grammars listed in languages.toml
    -c, --config <file>            Specifies a file to use for configuration
    -v                             Increases logging verbosity each use for up to 3 times
    --log <file>                   Specifies a file to use for logging
                                   (default file: /home/zxc/.cache/helix/helix.log)
    -V, --version                  Prints version information
    --vsplit                       Splits all given files vertically into different windows
    --hsplit                       Splits all given files horizontally into different windows
    -w, --working-dir <path>       Specify an initial working directory
    +N                             Open the first given file at line number N
```

```nix tangle:default.nix
        "helix"
```

## kakoune

Vim inspired text editor
[github](http://kakoune.org/)
`$ kak --help`

```
Usage: /nix/store/zj9w23myzqpdyw8ig8h5kwnyi0gdgclc-kakoune-unwrapped-2024.05.18/bin/kak [options] [file]... [+<line>[:<col>]|+:]

Options:
-c <arg>     connect to given session
-e <arg>     execute argument on client initialisation
-E <arg>     execute argument on server initialisation
-n           do not source kakrc files on startup
-s <arg>     set session name
-d           run as a headless session (requires -s)
-p <arg>     just send stdin as commands to the given session
-f <arg>     filter: for each file, select the entire buffer and execute the given keys
-i <arg>     backup the files on which a filter is applied using the given suffix
-q           in filter mode, be quiet about errors applying keys
-ui <arg>    set the type of user interface to use (terminal, dummy, or json)
-l           list existing sessions
-clear       clear dead sessions
-debug <arg> initial debug option value
-version     display kakoune version and exit
-ro          readonly mode
-help        display a help message and quit

Prefixing a positional argument with a plus (`+`) sign will place the
cursor at a given set of coordinates, or the end of the buffer if the plus
sign is followed only by a colon (`:`)
```

```nix tangle:default.nix
        "kakoune"
```

## ki

Multi-cursor structural editor
[official site](https://ki-editor.github.io/ki-editor/)

```nix tangle:default.nix
        "ki"
```

## nixvim

Configure Neovim with Nix!
[github](https://github.com/nix-community/nixvim)

```nix tangle:default.nix
        "nixvim"
```

## vim

Most popular clone of the VI editor
[official site](http://www.vim.org/)
`$ vim --help`

```
VIM - Vi IMproved 9.1 (2024 Jan 02, compiled Jan 01 1980 00:00:00)

Usage: vim [arguments] [file ..]       edit specified file(s)
   or: vim [arguments] -               read text from stdin
   or: vim [arguments] -t tag          edit file where tag is defined
   or: vim [arguments] -q [errorfile]  edit file with first error

Arguments:
   --			Only file names after this
   -g			Run using GUI (like "gvim")
   -f  or  --nofork	Foreground: Don't fork when starting GUI
   -v			Vi mode (like "vi")
   -e			Ex mode (like "ex")
   -E			Improved Ex mode
   -s			Silent (batch) mode (only for "ex")
   -d			Diff mode (like "vimdiff")
   -y			Easy mode (like "evim", modeless)
   -R			Readonly mode (like "view")
   -Z			Restricted mode (like "rvim")
   -m			Modifications (writing files) not allowed
   -M			Modifications in text not allowed
   -b			Binary mode
   -l			Lisp mode
   -C			Compatible with Vi: 'compatible'
   -N			Not fully Vi compatible: 'nocompatible'
   -V[N][fname]		Be verbose [level N] [log messages to fname]
   -D			Debugging mode
   -n			No swap file, use memory only
   -r			List swap files and exit
   -r (with file name)	Recover crashed session
   -L			Same as -r
   -A			Start in Arabic mode
   -H			Start in Hebrew mode
   -T <terminal>	Set terminal type to <terminal>
   --not-a-term		Skip warning for input/output not being a terminal
   --gui-dialog-file {fname}  For testing: write dialog text
   --ttyfail		Exit if input or output is not a terminal
   -u <vimrc>		Use <vimrc> instead of any .vimrc
   -U <gvimrc>		Use <gvimrc> instead of any .gvimrc
   --noplugin		Don't load plugin scripts
   -p[N]		Open N tab pages (default: one for each file)
   -o[N]		Open N windows (default: one for each file)
   -O[N]		Like -o but split vertically
   +			Start at end of file
   +<lnum>		Start at line <lnum>
   --cmd <command>	Execute <command> before loading any vimrc file
   -c <command>		Execute <command> after loading the first file
   -S <session>		Source file <session> after loading the first file
   -s <scriptin>	Read Normal mode commands from file <scriptin>
   -w <scriptout>	Append all typed commands to file <scriptout>
   -W <scriptout>	Write all typed commands to file <scriptout>
   -x			Edit encrypted files
   -X			Do not connect to X server
   --remote <files>	Edit <files> in a Vim server if possible
   --remote-silent <files>  Same, don't complain if there is no server
   --remote-wait <files>  As --remote but wait for files to have been edited
   --remote-wait-silent <files>  Same, don't complain if there is no server
   --remote-tab[-wait][-silent] <files>  As --remote but use tab page per file
   --remote-send <keys>	Send <keys> to a Vim server and exit
   --remote-expr <expr>	Evaluate <expr> in a Vim server and print result
   --serverlist		List available Vim server names and exit
   --servername <name>	Send to/become the Vim server <name>
   --startuptime <file>	Write startup timing messages to <file>
   --log <file>		Start logging to <file> early
   -i <viminfo>		Use <viminfo> instead of .viminfo
   --clean		'nocompatible', Vim defaults, no plugins, no viminfo
   -h  or  --help	Print Help (this message) and exit
   --version		Print version information and exit

Arguments recognised by gvim (GTK+ version):
   -background <color>	Use <color> for the background (also: -bg)
   -foreground <color>	Use <color> for normal text (also: -fg)
   -font <font>		Use <font> for normal text (also: -fn)
   -geometry <geom>	Use <geom> for initial geometry (also: -geom)
   -iconic		Start Vim iconified
   -reverse		Use reverse video (also: -rv)
   -display <display>	Run Vim on <display> (also: --display)
   --role <role>	Set a unique role to identify the main window
   --socketid <xid>	Open Vim inside another GTK widget
   --echo-wid		Make gvim echo the Window ID on stdout
```

```nix tangle:default.nix
        "vim"
        # keep-sorted end
      ];
    }
  )
)
```
