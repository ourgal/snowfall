# cli browser

```nix tangle:default.nix
args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
```

## lobtui

TUI for lobste.rs website.
[github](https://github.com/pythops/lobtui)
`$ lobtui --help`

```
TUI for lobste.rs website

Usage: lobtui

Options:
  -h, --help     Print help
  -V, --version  Print version
```

```nix tangle:default.nix
      "lobtui"
```

## neonmodem

Neon Modem Overdrive.
[github](https://github.com/mrusme/neonmodem)
`$ neonmodem --help`

```
neonmodem is a bulletin board system (BBS) text user interface written in Go, supporting Discourse and Lemmy.
More info available on https://xn--gckvb8fzb.com/projects/neonmodem

Usage:
  neonmodem [flags]
  neonmodem [command]

Available Commands:
  completion  Generate the autocompletion script for the specified shell
  connect     Connect to BBS
  help        Help about any command

Flags:
      --debug   Debug output
  -h, --help    help for neonmodem

Use "neonmodem [command] --help" for more information about a command.
```

```nix tangle:default.nix
      "neonmodem"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
```

## amfora

Fancy terminal browser for the Gemini protocol.
[github](https://github.com/makeworld-the-better-one/amfora)
`$ amfora --help`

```
Amfora is a fancy terminal browser for the Gemini protocol.

Usage:
amfora [URL]
amfora --version, -v
```

```nix tangle:default.nix
      "amfora"
```

## circumflex

Command line tool for browsing Hacker News in your terminal.
[github](https://github.com/bensadeh/circumflex)
`$ clx --help`

```
circumflex is a command line tool for browsing Hacker News in your terminal

Usage:
  clx [flags]
  clx [command]

Available Commands:
  add         Add item to list of favorites by ID
  article     Read the linked article associated with an item based on the ID
  clear       Clear the history of visited IDs
  comments    Go directly to the comment section by ID
  help        Help about any command
  url         Open the provided url in reader mode in the terminal
  version     Print the version number of circumflex

Flags:
  -a, --auto-expand         automatically expand all replies upon entering the comment section
      --categories string   set the categories in the header (default "top,best,ask,show")
  -c, --comment-width int   set the comment width (default 70)
  -e, --disable-emojis      disable conversion of smileys to emojis
  -d, --disable-history     disable marking stories as read
  -h, --help                help for clx
  -t, --hide-indent         hide the indentation bar to the left of the reply
  -n, --nerdfonts           enable Nerd Fonts
      --no-less-verify      disable checking less version on startup
  -o, --plain-comments      disable syntax highlighting for comments
  -p, --plain-headlines     disable syntax highlighting for headlines
  -v, --version             version for clx

Use "clx [command] --help" for more information about a command.
```

```nix tangle:default.nix
      "circumflex"
```

## w3m

Text-mode web browser.
[github](https://w3m.sourceforge.net/)

```nix tangle:default.nix
      "w3m"
      # keep-sorted end
    ];
```

## brotab

Control your browser's tabs from the command line.
[github](https://github.com/balta2ar/brotab)
`$ bt --help`

```
usage: bt [-h] [--target TARGET_HOSTS]
          {move,list,close,activate,active,search,query,index,new,open,navigate,update,words,text,html,dup,windows,clients,install}
          ...

bt (brotab = Browser Tabs) is a command-line tool that helps you manage
browser tabs. It can help you list, close, reorder, open and activate your
tabs.

positional arguments:
  {move,list,close,activate,active,search,query,index,new,open,navigate,update,words,text,html,dup,windows,clients,install}
    move                move tabs around. This command lists available tabs
                        and runs the editor. In the editor you can 1) reorder
                        tabs -- tabs will be moved in the browser 2) delete
                        tabs -- tabs will be closed 3) change window ID of the
                        tabs -- tabs will be moved to specified windows
    list                list available tabs. The command will request all
                        available clients (browser plugins, mediators), and
                        will display browser tabs in the following format:
                        "<prefix>.<window_id>.<tab_id><Tab>Page title<Tab>URL"
    close               close specified tab IDs. Tab IDs should be in the
                        following format: "<prefix>.<window_id>.<tab_id>". You
                        can use "list" command to obtain tab IDs (first
                        column)
    activate            activate given tab ID. Tab ID should be in the
                        following format: "<prefix>.<window_id>.<tab_id>"
    active              display active tab for each client/window in the
                        following format: "<prefix>.<window_id>.<tab_id>"
    search              Search across your indexed tabs using sqlite fts5
                        plugin.
    query               Filter tabs using chrome.tabs api.
    index               Index the text from browser's tabs. Text is put into
                        sqlite fts5 table.
    new                 open new tab with the Google search results of the
                        arguments that follow. One positional argument is
                        required: <prefix>.<window_id> OR <client>. If
                        window_id is not specified, URL will be opened in the
                        active window of the specifed client
    open                open URLs from the stdin (one URL per line). One
                        positional argument is required: <prefix>.<window_id>
                        OR <client>. If window_id is not specified, URL will
                        be opened in the active window of the specifed client
    navigate            navigate to URLs. There are two ways to specify tab
                        ids and URLs: 1. stdin: lines with pairs of
                        "tab_id<tab>url" 2. arguments: bt navigate <tab_id>
                        "<url>", e.g. bt navigate b.20.1 "https://google.com"
                        stdin has the priority.
    update              Update tabs state, e.g. URL. There are two ways to
                        specify updates: 1. stdin, pass JSON of the form:
                        [{"tab_id": "b.20.130", "properties": {"url":
                        "http://www.google.com"}}] Where "properties" can be
                        anything defined here:
                        https://developer.mozilla.org/en-US/docs/Mozilla/Add-
                        ons/WebExtensions/API/tabs/update Example: echo
                        '[{"tab_id":"a.2118.2156",
                        "properties":{"url":"https://google.com"}}]' | bt
                        update 2. arguments, e.g.: bt update -tabId b.1.862
                        -url="http://www.google.com" +muted
    words               show sorted unique words from all active tabs of all
                        clients. This is a helper for webcomplete plugin that
                        helps complete words from the browser
    text                show text form all tabs
    html                show html form all tabs
    dup                 display reminder on how to show duplicate tabs using
                        command-line tools
    windows             display available prefixes and window IDs, along with
                        the number of tabs in every window
    clients             display available browser clients (mediators), their
                        prefixes and address (host:port), native app PIDs, and
                        browser names
    install             configure browser settings to use bt mediator (native
                        messaging app)

options:
  -h, --help            show this help message and exit
  --target TARGET_HOSTS
                        Target hosts IP:Port
```

```nix tangle:default.nix
    enable = "brotab";
  }
)
```
