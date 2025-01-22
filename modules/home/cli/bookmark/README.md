# cli bookmark

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
```

## sunbeam

Command-line launcher.
[github](https://github.com/pomdtr/sunbeam)
`$ sunbeam --help`

```
Sunbeam is a command line launcher for your terminal, inspired by fzf and raycast.

See https://pomdtr.github.io/sunbeam for more information.

Usage:
  sunbeam [flags]
  sunbeam [command]

Core Commands:
  copy               Copy text from stdin or paste text to stdout
  edit               Open a file in your editor
  extension          Manage sunbeam extensions
  open               Open a file or url in your default application
  paste              Paste text from clipboard to stdout
  validate           Validate a Sunbeam schema

Extension Commands:

Additional Commands:
  completion         Generate the autocompletion script for the specified shell
  help               Help about any command
  version            Print the version number of sunbeam

Flags:
  -h, --help   help for sunbeam

Use "sunbeam [command] --help" for more information about a command.
```

```nix tangle:default.nix
    myPkgs = "sunbeam";
```

## buku

An bookmark manager.
[github](https://github.com/jarun/Buku)
`$ buku --help`

```
buku: waiting for input (unexpected? try --nostdin)
usage: buku [OPTIONS] [KEYWORD [KEYWORD ...]]

Bookmark manager like a text-based mini-web.

POSITIONAL ARGUMENTS:
      KEYWORD              search keywords

GENERAL OPTIONS:
      -a, --add URL [tag, ...]
                           bookmark URL with comma-separated tags
      -u, --update [...]   update fields of an existing bookmark
                           accepts indices and ranges
                           refresh title and desc if no edit options
                           if no arguments:
                           - update results when used with search
                           - otherwise refresh all titles and desc
      -w, --write [editor|index]
                           edit and add a new bookmark in editor
                           else, edit bookmark at index in EDITOR
                           edit last bookmark, if index=-1
                           if no args, edit new bookmark in EDITOR
      -d, --delete [...]   remove bookmarks from DB
                           accepts indices or a single range
                           if no arguments:
                           - delete results when used with search
                           - otherwise delete all bookmarks
      -h, --help           show this information and exit
      -v, --version        show the program version and exit

EDIT OPTIONS:
      --url keyword        bookmark link
      --tag [+|-] [...]    comma-separated tags
                           clear bookmark tagset, if no arguments
                           '+' appends to, '-' removes from tagset
      --title [...]        bookmark title; if no arguments:
                           -a: do not set title, -u: clear title
      -c, --comment [...]  notes or description of the bookmark
                           clears description, if no arguments
      --immutable N        disable web-fetch during auto-refresh
                           N=0: mutable (default), N=1: immutable

SEARCH OPTIONS:
      -s, --sany [...]     find records with ANY matching keyword
                           this is the default search option
      -S, --sall [...]     find records matching ALL the keywords
                           special keywords -
                           "blank": entries with empty title/tag
                           "immutable": entries with locked title
      --deep               match substrings ('pen' matches 'opens')
      -r, --sreg expr      run a regex search
      -t, --stag [tag [,|+] ...] [- tag, ...]
                           search bookmarks by tags
                           use ',' to find entries matching ANY tag
                           use '+' to find entries matching ALL tags
                           excludes entries with tags after ' - '
                           list all tags, if no search keywords
      -x, --exclude [...]  omit records matching specified keywords

ENCRYPTION OPTIONS:
      -l, --lock [N]       encrypt DB in N (default 8) # iterations
      -k, --unlock [N]     decrypt DB in N (default 8) # iterations

POWER TOYS:
      --ai                 auto-import bookmarks from web browsers
                           Firefox, Chrome, Chromium, Vivaldi, Edge
      -e, --export file    export bookmarks to Firefox format HTML
                           export XBEL, if file ends with '.xbel'
                           export Markdown, if file ends with '.md'
                           format: [title](url) <!-- TAGS -->
                           export Orgfile, if file ends with '.org'
                           format: *[[url][title]] :tags:
                           export buku DB, if file ends with '.db'
                           combines with search results, if opted
      -i, --import file    import bookmarks from file
                           supports .html .xbel .json .md .org .db
      -p, --print [...]    show record details by indices, ranges
                           print all bookmarks, if no arguments
                           -n shows the last n results (like tail)
      -f, --format N       limit fields in -p or JSON search output
                           N=1: URL; N=2: URL, tag; N=3: title;
                           N=4: URL, title, tag; N=5: title, tag;
                           N0 (10, 20, 30, 40, 50) omits DB index
      -j, --json [file]    JSON formatted output for -p and search.
                           prints to stdout if argument missing.
                           otherwise writes to given file
      --colors COLORS      set output colors in five-letter string
      --nc                 disable color output
      -n, --count N        show N results per page (default 10)
      --np                 do not show the subprompt, run and exit
      -o, --open [...]     browse bookmarks by indices and ranges
                           open a random bookmark, if no arguments
      --oa                 browse all search results immediately
      --replace old new    replace old tag with new tag everywhere
                           delete old tag, if new tag not specified
      --shorten index|URL  fetch shortened url from tny.im service
      --expand index|URL   expand a tny.im shortened url
      --cached index|URL   browse a cached page from Wayback Machine
      --suggest            show similar tags when adding bookmarks
      --tacit              reduce verbosity, skip some confirmations
      --nostdin            do not wait for input (must be first arg)
      --threads N          max network connections in full refresh
                           default N=4, min N=1, max N=10
      -V                   check latest upstream version available
      -g, --debug          show debug information and verbose logs

SYMBOLS:
      >                    url
      +                    comment
      #                    tags

Version 4.8
Copyright © 2015-2022 Arun Prakash Jana <engineerarun@gmail.com>
License: GPLv3
Webpage: https://github.com/jarun/buku
```

```nix tangle:default.nix
    enable = "buku";
  }
)
```
